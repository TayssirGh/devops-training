#!/bin/sh

build(){
    docker build applications/${image_name} -t "${T015_REGISTRY_USER_NAME}/t015-${image_name}:${image_tag}"
    docker push "${T015_REGISTRY_USER_NAME}/t015-${image_name}:${image_tag}"
}

echo "build image ${image_name} ${image_tag}"
build
