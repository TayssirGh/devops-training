#!/bin/bash

sudo apt update && sudo apt upgrade

sudo apt-get docker docker-compose

curl -LJO "https://s3.dualstack.us-east-1.amazonaws.com/gitlab-runner-downloads/latest/deb/gitlab-runner_amd64.deb"
sudo dpkg -i gitlab-runner_amd64.deb

sudo useradd -s /bin/bash -m app-runner
sudo usermod -aG app-runner docker
sudo usermod -aG app-runner docker-compose

sudo apt install openssh-server
sudo systemctl enable ssh
sudo ufw allow ssh




 