# Solution

### update and upgrade the system 

```sh
sudo apt-get update && sudo apt-get upgrade
```

### install the following package 

#### install docker 
```sh
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

#### Add Docker's official GPG key:
```sh
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

#### Add the repository to Apt sources:
```sh
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
#### install the docker packages
```sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
### Install Compose standalone

```sh
curl -SL https://github.com/docker/compose/releases/download/v2.28.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

#### Instaliing  gitlab-runner

```sh
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash

sudo apt-get install gitlab-runner

sudo systemctl status gitlab-runner
```

### Adding a user with access to previous package

#### Create user named app-runner
```sh
sudo adduser app-runner
```
#### adding access
```sh
sudo groupadd docker
sudo usermod -aG docker app-runner 
sudo usermod -aG gitlab-runner app-runner
```

### Enabling SSH connections to the machine through the use of key files

#### Enabling SSH on Ubuntu
```sh
sudo apt install openssh-server

sudo systemctl start ssh
```

#### Allow SSH Through Firewall
```sh
sudo ufw allow ssh
```

#### Connect to Your Machine via SSH
```sh
ssh username@<machine-ip-address>
```

### Installing k3d on the machine.
```sh
sudo apt install -y curl
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d version
```