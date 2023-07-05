#!bin/bash

install_kubeseal () {

    mkdir -p kubeseal-0.22.0-linux-amd64

    sudo wget -P ./kubeseal-0.22.0-linux-amd64 https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.22.0/kubeseal-0.22.0-linux-amd64.tar.gz

    sudo tar xzvf kubeseal-0.22.0-linux-amd64.tar.gz --directory ./kubeseal-0.22.0-linux-amd64

    sudo install -m 755 ./kubeseal-0.22.0-linux-amd64/kubeseal /usr/local/bin/kubeseal

    rm -rf kubeseal-0.22.0-linux-amd64
}

if command -v kubeseal >/dev/null 2>&1 ; then
    echo -e "version: $(kubeseal --version) \n Skipping installation"
else
    echo "Installing kubeseal"
    install_kubeseal
fi

for var in "$@"
do
    cat $var.yml | kubeseal --controller-namespace kube-system \
        --controller-name sealed-secrets-controller \
            --format yaml > sealed-$var-secret.yml
    echo "Generated : sealed-$var-secret.yaml"
done

echo "Finished"
