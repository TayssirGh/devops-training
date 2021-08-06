#!/bin/sh
normalize() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9._-]//g'
}

# Build and tag the image based on the git branches in the current directory:
build_versions() {
  image="$1"
  shift
  if [ ! -d '.git' ]; then
    # Not a git repository, so simply build a "latest" image version:
    docker build -t "$image" "$@" .
    return $?
  fi
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  # Iterate over all branches:
  branches=$(git for-each-ref --format='%(refname:short)' refs/heads/)
  for branch in $branches; do
    git checkout "$branch"
    # Tag master as "latest":
    if [ "$branch" = 'master' ]; then
      branch='latest'
    fi
    # Normalize the branch name:
    branch="$(normalize "$branch")"
    # Build and tag the image with the branch name:
    docker build -t "$image:$branch" "$@" .
  done
  git checkout "$current_branch"
}
build() {
  cwd="$PWD"
  file="$(.dockerfile "$1")"
  dir="$(dirname "$1")"
  cd "$dir" || return 1
  organization="$DOCKER_ORG"
  if [ -z "$organization" ]; then
    # Use the parent folder for the organization/user name:
    organization="$(cd .. && normalize "$(extra_exercices/ex1 "$PWD")")"
  fi
  if [ -n "$DOCKER_HUB" ]; then
    organization="$DOCKER_HUB/$organization"
  fi
  # Use the current folder for the image name:
  image="$organization/$(normalize "$(basename "$PWD")")"
  # Check if the image depends on another image of the same organization:
  from=$(grep "^FROM $organization/" "$file" | awk '{print $2}')
  # If it does, only build if the image is already available:
  if [ -z "$from" ] || docker inspect "$from" > /dev/null 2>&1; then
    build_versions "$image" -f "$file"
  else
    echo "$image requires $from ..." >&2 && false
  fi
  status=$?
  cd "$cwd" || return 1
  return $status
}

build_images() {
  # Set the maximum number of calls on the first run:
  if [ "$MAX_CALLS" = 0 ]; then
    # Worst case scenario needs n*(n+1)/2 calls for dependency resolution,
    # which is the sum of all natural numbers (1+2+3+4+...n).
    # n is the number of arguments (=Dockerfiles) provided:
    MAX_CALLS=$(($#*($#+1)/2))
  fi
  CALLS=$((CALLS+1))
  if [ $CALLS -gt $MAX_CALLS ]; then
    echo 'Could not resolve image dependencies.' >&2
    return 1
  fi
  for file; do
    # Shift the arguments list to remove the current Dockerfile:
    shift
    # Basic check if the file is a valid Dockerfile:
    if ! grep '^FROM ' "$file"; then
      echo "Invalid Dockerfile: $file" >&2
      continue
    fi
    if ! build "$file"; then
      # The current build requires another image as dependency,
      # so we add it to the end of the build list and start over:
      build_images "$@" "$file"
      return $?
    fi
  done
}

MAX_CALLS=0
CALLS=0
NEWLINE=''

# Parses the arguments, finds Dockerfiles and starts the builds:
init() {
  args=
  for arg; do
    if [ -d "$arg" ]; then
      # Search for Dockerfiles and add them to the list:
      args="$args$NEWLINE$(find "$arg" -name Dockerfile)"
    else
      args="$args$NEWLINE$arg"
    fi
  done
  # Set the list as arguments, splitting only at newlines:
  IFS="$NEWLINE";
  # shellcheck disable=SC2086
  set -- $args;
  unset IFS
  build_images "$@"
}

init "${@:-.}"
