#!/bin/bash
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