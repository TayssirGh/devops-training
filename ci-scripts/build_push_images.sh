#! /bin/bash

init(){
}
build(){
    docker build applications/${image_name} -t "${T006_REGISTRY_USER_NAME}/t006-${image_name}:${image_tag}"
    docker push "${T006REGISTRY_USER_NAME}/t006-${image_name}:${image_tag}"
}

echo "build image ${image_name} ${image_tag}"
init
build
