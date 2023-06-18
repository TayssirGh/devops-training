curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

docker build applications/${image_name} --tag "${T007_REGISTRY_USER_NAME}/t-007-${image_name}:${image_tag}"




