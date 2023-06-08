#! /bin/bash

docker build applications/${image_name} --tag "${T005_REGISTRY_USER_NAME}/t005-${image_name}:${image_tag}"

docker push "${T005_REGISTRY_USER_NAME}/t005-${image_name}:${image_tag}"