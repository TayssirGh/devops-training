#!/bin/bash

echo "----------------- checking if helm is a installed -----------------"

if apt list --installed | grep -q "helm"; then
    echo "helm is already installed"
else
    echo "helm is not installed."
    sudo apt-get install helm 
fi

echo "----------------- checking if there is a running cluster -----------------"

chmod +x ./applications/init-k3d-cluster.sh
./applications/init-k3d-cluster.sh