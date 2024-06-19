# Updating the system and upgrading pre-installed packages:
    - sudo apt update 
        * This command updates the APT package index before installing new packages or upgrading them
    - sudo apt upgrade
        * This command upgrades the installed packages to their latest versions

# Installing the following packages :
    - docker:
        * Setting up the Docker's apt repository : 
        # Add Docker's official GPG key:
        sudo apt-get install ca-certificates curl
        sudo install -m 0755 -d /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc

        # Add the repository to Apt sources:
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update
        * Installing docker's latest version : 
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin

    - docker-compose:
    * sudo apt-get install docker-compose-plugin

    - gitlab-runner:
    * curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
    This command adds the official GitLab repository to the system
    * sudo apt-get install gitlab-runner
    This command installs the latest gitlab-runner package


# Adding a user named `app-runner` with access to `docker`, `docker-compose`, and `gitlab-runner`.
    * sudo adduser app-runner
    This command creates a new user
    * sudo usermod -aG sudo app-runner
    This command grants the app-runner user with sudo privileges

# Enabling `SSH` connections to the machine through the use of key files.
    * ssh-keygen -t rsa
    This command generates an SSH key pair associated to the machine in order to be able to access it through SSH
    * ssh-copy-id username@remote_host
    This command copies the public key to an existing server to be able to connect through ssh
    * ssh username@remote_host 
    This command connects to a remote host through SSH

# Installing `k3d` on the machine.
    * curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
    This command installs the current k3d latest release