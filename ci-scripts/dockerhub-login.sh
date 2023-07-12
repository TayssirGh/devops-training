#!/usr/bin/env bash


echo "${009_DOCKER_HUB_PWD}" | docker login -u "${009_DOCKER_HUB_NAME}" --password-stdin