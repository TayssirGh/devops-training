#!/bin/bash

#upgrading
sudo apt update 
sudo apt upgrade

#installing docker dependencies
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash

#Installing packages
pkgs=(docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin gitlab-runner)
sudo apt-get install "${pkgs[@]}"

#adding a new user
sudo adduser app-runner
sudo usermod -aG sudo app-runner

#generating ssh key pairs
ssh-keygen -t rsa
##ssh-copy-id username@remote_host
ssh-copy-id $1@$2
ssh $1@$2

# Installing `k3d` on the machine
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
