echo "-----------sealing secrets"


if  ! command -v kubeseal &> /dev/null; then
    echo "-----------kubeseal is not installed attempting to install-----------k"
    
    mkdir kubeseal-0.22.0-linux-amd64 && cd kubeseal-0.22.0-linux-amd64

    sudo wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.22.0/kubeseal-0.22.0-linux-amd64.tar.gz

    sudo tar xzvf kubeseal-0.22.0-linux-amd64.tar.gz

    sudo install -m 755 ./kubeseal /usr/local/bin/kubeseal
    cd ..
    sudo rm -rf ./kubeseal-0.22.0-linux-amd64

    echo "-----------kubeseal installed-----------k"
fi

for file in secrets-*.yml; do
    cat $file | kubeseal \
        --controller-namespace kube-system \
        --controller-name sealed-secrets-controller \
        --format yaml \
        > sealed-$file
    # rm $file
done