#!/usr/bin/env bash

generate_ssh_keys() {
    if [ ! -f "$USER_HOME/.ssh/id_rsa" ]; then
        echo "Generating SSH keys..."
        sudo -u your_username ssh-keygen -t rsa -b 4096 -f "$USER_HOME/.ssh/id_rsa" -N ""
    else
        echo "SSH keys already exist. Skipping key generation."
    fi
}
update_the_system(){
  zypper refresh && sudo zypper update -y
}
install_docker(){
  zypper install -y docker
  systemctl enable docker
  systemctl start docker
}
install_gitlab_runner(){
  zypper install -y docker-compose
  if [ -e /usr/local/bin/gitlab-runner ]; then
      echo "Gitlab Runner already installed"
  else
      curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
      chmod +x /usr/local/bin/gitlab-runner
  fi
}
add_user(){
  useradd -m -s /bin/bash app-runner
  usermod -aG docker app-runner
  usermod -aG gitlab-runner app-runner
}
install_k3d(){
  wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
}
enable_ssh_connection(){
  systemctl start sshd.service
  read -p "Enter the remote username: " REMOTE_USER
  read -p "Enter the remote host (IP address or hostname): " REMOTE_HOST
  if [ ! -f "$SSH_KEY" ]; then
          echo "SSH key not found. Generating new SSH key..."
          ssh-keygen -t rsa -b 4096 -f "$SSH_KEY" -N "" -C "$REMOTE_USER@$REMOTE_HOST"
      else
          echo "SSH key found."
      fi
  echo "Copying SSH key to the remote server..."
  ssh-copy-id "$REMOTE_USER@$REMOTE_HOST"
  ssh "$REMOTE_USER@$REMOTE_HOST"
}

#MAIN PROGRAM
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi
update_the_system
install_docker
install_gitlab_runner
add_user
enable_ssh_connection
install_k3d


