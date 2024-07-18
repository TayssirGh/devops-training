#!/bin/bash

echo "____________________________________________________________"
echo "getting into seal-secrets script"
echo "____________________________________________________________"

#Installation of sealedsecrets

helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets

helm install my-release sealed-secrets/sealed-secrets

# installation of Kubeseal

# KUBESEAL_VERSION=$(curl -s https://api.github.com/repos/bitnami-labs/sealed-secrets/tags | jq -r '.[0].name' | cut -c 2-)

# if [ -z "$KUBESEAL_VERSION" ]; then
#     echo "Failed to fetch the latest KUBESEAL_VERSION"
#     exit 1
# fi

# curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz"
# tar -xvzf kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz kubeseal
# sudo install -m 755 kubeseal /usr/local/bin/kubeseal

# kubeseal --fetch-cert --controller-name my-release-sealed-secrets --controller-namespace default

kubeseal --version 

# sealing the secrets

cp applications/training-app-deployment/secrets.yml ./

kubeseal --controller-name my-release-sealed-secrets --controller-namespace default --format yaml < secrets.yml > sealed-secret.yaml

kubectl apply -f sealed-secret.yaml

rm secrets.yml

# deleting regular secrets from the Git tree

# git rm --cached secrets.yml
# cd ../../
# echo applications/training-app-deployment/secrets.yml >> .gitignore