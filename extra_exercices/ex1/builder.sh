#!/bin/bash

check_docker_installed() {
  if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
  fi
}

check_file_exists() {
  if [ ! -f "$1" ]; then
    echo "File $1 does not exist."
    exit 1
  fi
}
check_build(){
  docker build -f $1 -t $2 .
  echo "$1"
  if [ $? -ne 0 ]; then
    echo "Failed to build $1 image."
    exit 1
  fi
}
check_docker_installed
check_file_exists "debian.Dockerfile"
check_file_exists "alpine.Dockerfile"
check_file_exists "Dockerfile"
check_build "debian.Dockerfile" "ex-deb"
check_build  "alpine.Dockerfile" "ex-alp"
check_build  "Dockerfile" "ex-alp-val"
echo "All images are successfully built !"
