#! /bin/bash

docker build applications/${image_name} -t "${T006_REGISTRY_USER_NAME}/t006-${image_name}:${tag_name}"

docker push "${T006REGISTRY_USER_NAME}/t006-${image_name}:${tag_name}"
