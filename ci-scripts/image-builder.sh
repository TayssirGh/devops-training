#!/bin/bash
build(){
if [[ "$CI_COMMIT_REF_NAME" == "t-001-dev" ]]; then
    docker build -t  "${T001_USERNAME}/t001-${IMAGE_NAME}:dev"  -f ./applications/${IMAGE_NAME}/Dockerfile ./applications/${IMAGE_NAME}
    docker push "${T001_USERNAME}/t001-${IMAGE_NAME}:dev"
else
    docker build -t  "${T001_USERNAME}/t001-${IMAGE_NAME}:prod"  -f ./applications/${IMAGE_NAME}/Dockerfile ./applications/${IMAGE_NAME}
    docker push "${T001_USERNAME}/t001-${IMAGE_NAME}:prod"
fi
}
echo  "${T001_USERNAME}/t001-${IMAGE_NAME}"
build