#!/bin/bash

build() {
  tag=${1}

  echo "Building ${T003_USERNAME}/t003-${IMAGE_NAME}:${tag}"
  docker build -t "${T003_USERNAME}/t003-${IMAGE_NAME}:${tag}" \
    -f "./applications/${IMAGE_NAME}/Dockerfile" "./applications/${IMAGE_NAME}"

  echo "Pushing ${T003_USERNAME}/t003-${IMAGE_NAME}:${tag}"
  docker push "${T003_USERNAME}/t003-${IMAGE_NAME}:${tag}"
}

for tag in ${IMAGE_TAG}; do
  echo "Building tag : ${tag}"
  build "${tag}"
done