#! /bin/bash
echo "${T007_REGISTRY_USER_NAME}/t-007-${image_name}:${image_tag}"
docker ps
docker tag "${T007_REGISTRY_USER_NAME}/t-007-${image_name}:${image_tag}" "${T007_REGISTRY_USER_NAME}/t-007-${image_name}:${image_tag}"
docker push "${T007_REGISTRY_USER_NAME}/t-007-${image_name}:${image_tag}"