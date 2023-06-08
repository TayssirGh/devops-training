#! /bin/bash

docker build applications/${image_name} -t "${registry_name}/t005-${image_name}:${tag_name}"

docker push "registry_name/t005-${image_name}:${tag_name}"