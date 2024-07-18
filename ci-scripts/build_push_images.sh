docker build "applications/${image_name}" --tag "${T015_REGISTRY_USER_NAME}/t015-${image_name}:${image_tag}"

docker push "${T015_REGISTRY_USER_NAME}/t015-${image_name}:${image_tag}"
