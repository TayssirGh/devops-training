#!/usr/bin/env bash
chmod u+x ./ci-scripts/dockerhub-login.sh 

echo "${t_009_DOCKER_HUB_PWD}" | docker login -u "${t_009_DOCKER_HUB_NAME}" --password-stdin