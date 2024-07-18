#!/bin/bash

echo "____________________________________________________________"
echo "getting into seal-secrets script"
echo "____________________________________________________________"

#Installation of sealedsecrets

if helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets | grep already; 
then echo "----------------- installing kubeseal -----------------"
else helm install my-release sealed-secrets/sealed-secrets
fi 

# installation of Kubeseal
echo "----------------- installing kubeseal -----------------"

if kubeseal --version | grep version ; then 
    echo "kubeseal already installed"

else

    KUBESEAL_VERSION=$(curl -s https://api.github.com/repos/bitnami-labs/sealed-secrets/tags | jq -r '.[0].name' | cut -c 2-)

    if [ -z "$KUBESEAL_VERSION" ]; then
        echo "Failed to fetch the latest KUBESEAL_VERSION"
        exit 1
    fi

    curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz"
    tar -xvzf kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz kubeseal
    sudo install -m 755 kubeseal /usr/local/bin/kubeseal

    kubeseal --fetch-cert --controller-name my-release-sealed-secrets --controller-namespace default
fi 

kubeseal --version 

# sealing the secrets

if find secrets.yml ; 
then 
    kubeseal --controller-name my-release-sealed-secrets --controller-namespace default --format yaml < secrets.yml > sealed-secret.yaml
    kubectl apply -f sealed-secret.yaml

    # deleting regular secrets from the Git tree
    git rm --cached secrets.yml
    cd ../../
    echo applications/training-app-deployment/secrets.yml >> .gitignore
else 
    if find sealed-secret.yaml;
    then echo "secrets.yml not found, sealed-secret already exists"
    fi 
fi 