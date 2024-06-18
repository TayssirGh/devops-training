#Update the system and upgrade pre-installed packages
-------------------------------------
1) >sudo zypper refresh && sudo zypper update -y
-------------------------------------
#Install the following packages (docker/docker-compose/gitlab-runner):
-------------------------------------
2) docker installation
   >sudo zypper install -y docker

   docker-compose installation
   >sudo zypper install -y docker-compose

   gitlab-runner installation
   >curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash
   >sudo zypper install gitlab-runner

-------------------------------------
# Add a user named `app-runner` with access to `docker`, `docker-compose`, and `gitlab-runner`.
-------------------------------------
5) >sudo useradd -m -s /bin/bash app-runner
   >sudo usermod -aG docker app-runner    /*By default, docker-compose can be executed by any user with access to Docker*/
   >sudo usermod -aG gitlab-runner app-runner
-------------------------------------
# Enable `SSH` connections to the machine through the use of key files.
-------------------------------------
6) >systemctl start sshd.service

   >systemctl enable sshd.service

   genereate the SSH key pair

   >ssh-keygen -t rsa

   output the contents of the file
   >cat ~/.ssh/id_rsa.pub


>ssh username@server_address /*connect to the host*/
-------------------------------------
# Install `k3d` on the machine.
-------------------------------------
7) >wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash



