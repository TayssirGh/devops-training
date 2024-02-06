#!/bin/bash

echo "update the system and upgrade pre-installed packages ..."

sudo apt update

sudo apt upgrade

echo "installing docker ..."

sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt-get install docker-ce

echo "installing docker-compose ..."
sudo apt install docker-compose

echo "installing gitlab-runner ..."
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash

sudo apt-get install gitlab-runner

echo "Add a user named app-runner with access to docker, docker-compose, and gitlab-runner ..."
sudo adduser app-runner

echo "Enable SSH connections to the machine through the use of key files ..."
ssh-keygen

echo "Install k3d ..."
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
