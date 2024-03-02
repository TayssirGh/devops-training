#!/bin/bash

# Step 1: Update the system and upgrade pre-installed packages
sudo apt update
sudo apt upgrade -y

# Step 2: Install required packages (docker, docker-compose, gitlab-runner)
sudo apt install docker.io -y
sudo apt install docker-compose -y
sudo apt install gitlab-runner -y

# Step 3: Add a user named app-runner with access to docker, docker-compose, and gitlab-runner
sudo adduser app-runner
sudo usermod -aG docker app-runner
sudo usermod -aG gitlab-runner app-runner

# Step 4: Enable SSH connections to the machine through key files
sudo mkdir -p /home/app-runner/.ssh
sudo cp /home/mehdi/.ssh/id_rsa.pub /home/app-runner/.ssh/authorized_keys
sudo chown -R app-runner:app-runner /home/app-runner/.ssh
sudo chmod 700 /home/app-runner/.ssh
sudo chmod 600 /home/app-runner/.ssh/authorized_keys

# Step 5: Install k3d on the machine
wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
sudo usermod -aG docker app-runner



