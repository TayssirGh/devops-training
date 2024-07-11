#!/bin/bash
#installation part--
sudo apt install helm
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm install sealed-secrets -n kube-system --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets
# shellcheck disable=SC2034
KUBESEAL_VERSION=$(curl -s https://api.github.com/repos/bitnami-labs/sealed-secrets/tags | jq -r '.[0].name' | cut -c 2-)
if [ -z "$KUBESEAL_VERSION" ]; then
    echo "Failed to fetch the latest KUBESEAL_VERSION"
    exit 1
fi
curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz"
tar -xvzf kubeseal-"${KUBESEAL_VERSION}"-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal

#sealing the secrets--
SEALED_DIR="sealedsecret"

SECRETS=("tls-secrets.yaml" "db-secret.yaml" "s3-secret.yaml")

if ! command -v kubeseal &> /dev/null
then
    echo "kubeseal could not be found. Please install it and try again."
    exit 1
fi

if [ ! -d "$SEALED_DIR" ]; then
    mkdir -p "$SEALED_DIR"
    echo "Created directory $SEALED_DIR"
fi

for SECRET in "${SECRETS[@]}"; do
    if [ -f "$SECRET" ]; then
        kubeseal -f "$SECRET" -w "$SEALED_DIR/${SECRET%.yaml}-sealedsecret.yaml"
        echo "Sealed $SECRET into $SEALED_DIR/${SECRET%.yaml}-sealedsecret.yaml"

        if [ $? -eq 0 ]; then
            rm "$SECRET"
            echo "Removed original $SECRET"
        else
            echo "Failed to seal $SECRET"
        fi
    else
        echo "File $SECRET does not exist. Skipping."
    fi
done

echo "All secrets processed."