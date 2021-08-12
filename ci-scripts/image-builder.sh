#!/bin/bash

build() {
  tag=${1}

  echo "Building ${T001_USERNAME}/t001-${IMAGE_NAME}:${tag}"
  docker build -t "${T001_USERNAME}/t001-${IMAGE_NAME}:${tag}" \
    -f "./applications/${IMAGE_NAME}/Dockerfile" "./applications/${IMAGE_NAME}"

  echo "Pushing ${T001_USERNAME}/t001-${IMAGE_NAME}:${tag}"
  docker push "${T001_USERNAME}/t001-${IMAGE_NAME}:${tag}"
}

for tag in ${IMAGE_TAG}; do
  echo "Building tag : ${tag}"
  build "${tag}"
done