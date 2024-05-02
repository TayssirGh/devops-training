# Solution

#### Update the system and upgrade pre-installed packages

```sh
sudo apt update && sudo apt upgrade
```

### Install the following packages
Installing _docker_, _docker-compose_ 

```sh
sudo apt-get docker docker-compose
```
Instaliing  _gitlab-runner_
```sh
curl -LJO "https://s3.dualstack.us-east-1.amazonaws.com/gitlab-runner-downloads/latest/deb/gitlab-runner_amd64.deb"
sudo dpkg -i gitlab-runner_amd64.deb
```

### Adding a user with access to previous package
We have created a user app-runner, then we add it to docker and docker-compose groups so that he can use them. The new user can use the gitlab-runner because the execution of gitlab-runner is not running directly within the current user's shell environment, its running under the gitlab-runner user
```sh
sudo useradd -s /bin/bash -m app-runner
sudo usermod -aG app-runner docker
sudo usermod -aG app-runner docker-compose
```

### Enabling SSH connection
Installing the openssh-server:
```sh
sudo apt install openssh-server
```

Enabling the service:
```sh
sudo systemctl enable ssh
```

Open ssh tcp port 22 using ufw firewall
```sh
sudo ufw allow ssh
```



 