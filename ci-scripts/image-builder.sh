#!/bin/bash
build(){
    docker build -t  "${t_002_CI_REGISTRY_USER}/t002-${IMAGE_NAME}:${TAG_IMAGE}"  -f ./applications/${IMAGE_NAME}/Dockerfile ./applications/${IMAGE_NAME}
    docker push "${t_002_CI_REGISTRY_USER}/t002-${IMAGE_NAME}:${TAG_IMAGE}"
}
echo  "${t_002_CI_REGISTRY_USER}/t002-${IMAGE_NAME} "
build