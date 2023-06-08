#! /bin/bash

docker build applications/${image_name} -t "${T005_REGISTRY_USER_NAME}/t005-${image_name}:${tag_name}"

docker push "${T005_REGISTRY_USER_NAME}/t005-${image_name}:${tag_name}"