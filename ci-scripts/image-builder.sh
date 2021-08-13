#!/bin/bash

build() {
  tag=${1}

  echo "Building ${T-003_USERNAME}/t-003-${IMAGE_NAME}:${tag}"
  docker build -t "${T-003_USERNAME}/t-003-${IMAGE_NAME}:${tag}" \
    -f "./applications/${IMAGE_NAME}/Dockerfile" "./applications/${IMAGE_NAME}"

  echo "Pushing ${T-003_USERNAME}/t-003-${IMAGE_NAME}:${tag}"
  docker push "${T-003_USERNAME}/t-003-${IMAGE_NAME}:${tag}"
}

for tag in ${IMAGE_TAG}; do
  echo "Building tag : ${tag}"
  build "${tag}" || exit 1
done