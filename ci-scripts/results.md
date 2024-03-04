## Results for Exercise 1 - Step 1

1. Update the system and upgrade pre-installed packages:

    ```bash  
    sudo apt update
    sudo apt upgrade -y 
    ```

    Explanation: These commands ensure that the system is up-to-date with the latest packages.

## Results for Exercise 1 - Step 2

2. Install the required packages (docker, docker-compose, gitlab-runner):

    ```bash
    sudo apt install docker.io -y
    sudo apt install docker-compose -y
    sudo apt install gitlab-runner -y
    ```

    Explanation: These commands install Docker, Docker Compose, and GitLab Runner, which are essential tools for containerization and CI/CD processes.

## Results for Exercise 1 - Step 3

3. Add a user named app-runner with access to docker, docker-compose, and gitlab-runner:

    ```bash
    sudo adduser app-runner
    sudo usermod -aG docker app-runner
    sudo usermod -aG gitlab-runner app-runner
    ```

    Explanation: These commands create a user named app-runner and add it to the docker and gitlab-runner groups, providing the necessary permissions to run Docker and GitLab Runner commands.

## Results for Exercise 1 - Step 4

4. Enable SSH connections to the machine through the use of key files:

    ```bash
    sudo mkdir -p /home/app-runner/.ssh
    sudo cp /home/mehdi/.ssh/id_rsa.pub /home/app-runner/.ssh/authorized_keys
    sudo chown -R app-runner:app-runner /home/app-runner/.ssh
    sudo chmod 700 /home/app-runner/.ssh
    sudo chmod 600 /home/app-runner/.ssh/authorized_keys
    ```

    Explanation: These commands set up SSH access for the app-runner user by creating the necessary SSH directory, copying the public key, and adjusting permissions.

## Results for Exercise 1 - Step 5

5. Install k3d on the machine:

    ```bash
    wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
    sudo usermod -aG docker app-runner
    ```

    Explanation: These commands download and install k3d, a lightweight Kubernetes distribution, and add the app-runner user to the docker group for k3d to function correctly.

# Continue with any additional steps and explanations as needed
![01](/home/mehdi/01.png)
