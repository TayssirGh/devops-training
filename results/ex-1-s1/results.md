Update the system and upgrade pre-installed packages:
	sudo apt update : ensures the system has the latest informations on installed packages
	sudo apt upgrade : used to upgrade the installed packages to their latest versions

Install the following packages :

docker
	sudo apt install apt-transport-https ca-certificates curl software-properties-common : prerequisite packages needed to install docker from the official Docker repository.
	
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - : adding GPG key for the official Docker repository

	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" : adding docker repository to apt sources

	sudo apt-get install docker-ce : installing docker
	
docker-compose
	sudo apt install docker-compose

gitlab-runner
	curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash : download the repo

	sudo apt-get install gitlab-runner : install gitlab-runner


Add a user named app-runner with access to docker, docker-compose, and gitlab-runner.
	sudo adduser app-runner
Enable SSH connections to the machine through the use of key files.
	ssh-keygen : generating ssh key
Install k3d on the machine.
	curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash : installing k3d
