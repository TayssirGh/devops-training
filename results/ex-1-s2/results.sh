#!/bin/bash

# Add the user
sudo adduser --disabled-password --gecos "" app-runner
echo "app-runner:your_password" | sudo chpasswd

# Add the user to the docker group
sudo usermod -aG docker app-runner

# Add the user to the gitlab-runner group
sudo usermod -aG gitlab-runner app-runner

# Enable SSH connections through the use of key files
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
ssh-copy-id -i ~/.ssh/id_rsa.pub app-runner@your_remote_machine

# Install k3d
wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

echo "Setup complete. Please verify the setup by logging in as app-runner and checking the installed versions of docker, docker-compose, gitlab-runner, and k3d."
