#! /bin/bash

docker build applications/${image_name} --tag "${T011_REGISTRY_USER_NAME}/t011-${image_name}:${image_tag}"

docker push "${T011_REGISTRY_USER_NAME}/t011-${image_name}:${image_tag}"
