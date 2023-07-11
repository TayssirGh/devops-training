#!/bin/bash

echo "-----------sealing secrets-----------"


if  ! command -v kubeseal &> /dev/null; then
    echo "-----------kubeseal is not installed attempting to install-----------"
    
    mkdir kubeseal-0.22.0-linux-amd64 && cd kubeseal-0.22.0-linux-amd64

    sudo wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.22.0/kubeseal-0.22.0-linux-amd64.tar.gz

    sudo tar xzvf kubeseal-0.22.0-linux-amd64.tar.gz

    sudo install -m 755 ./kubeseal /usr/local/bin/kubeseal
    cd ..
    sudo rm -rf ./kubeseal-0.22.0-linux-amd64

    echo "-----------kubeseal installed-----------"
fi

# using kubctl
# for file in secrets-*.yml; do
#     envs_names=$(grep -oP '(?<=#).*(?=#)' $file)
#     for env_name in $envs_names
#     do
#         env_value=$(printenv $env_name)
#         sed -i "s|#${env_name}#|${env_value}|" $file
#     done
#     eval "echo \"$(cat $file)\"" > $file
#     cat $file | kubeseal \
#         --controller-namespace kube-system \
#         --controller-name sealed-secrets-controller \
#         --format yaml \
#         > sealed-$file
#     rm $file
# done


# using helm
VALUE_FILE="app-chart/values.yaml"

seal_secrets(){
    INDEX=$1
    NAMESPACE=$2
    NAME=$3
    data=$(yq -r ".secrets[$i].data | keys | .[]" $VALUE_FILE)
    env_names=$(grep -oP '(?<=#).*(?=#)' $VALUE_FILE)

    for env_name in $data
    do
        env_value=$(yq -r ".secrets[$INDEX].data.$env_name" $VALUE_FILE)
        if [[ $env_value == ENV_* ]]; then
            env_value=$(printenv ${env_value:4})
            echo $env_value
        fi
        SEALED_VALUES=$(echo -n ${env_value} | kubeseal --raw --name $NAME --namespace $NAMESPACE --from-file=/dev/stdin)
        yq -i ".secrets[$INDEX].data.$env_name = \"$SEALED_VALUES\"" $VALUE_FILE
    done
}

len=$(yq -r '.secrets | length' $VALUE_FILE)
for ((i=0;i<len;i++)); do
    namespace=$(yq -r ".secrets[$i].namespace" $VALUE_FILE)
    name=$(yq -r ".secrets[$i].name" $VALUE_FILE)
    seal_secrets $i $namespace $name
done