#!/bin/bash

if ! command -v k3d &> /dev/null
then
    echo "k3d could not be found. Please install k3d and try again."
    exit
fi
k3d cluster list

CLUSTER_NAME="training"
if k3d cluster list | grep -q "$CLUSTER_NAME"; then
    echo "Cluster already exists ! "
    kubectl config set-context k3d-$CLUSTER_NAME
else
    echo "New cluster"
    k3d cluster create $CLUSTER_NAME \
        --servers 1 \
        --agents 1 \
        --port 80:80@loadbalancer \
        --port 443:443@loadbalancer \
        --volume ~/cluster_data:/data

    k3d kubeconfig merge $CLUSTER_NAME --kubeconfig-switch-context
    echo "Cluster $CLUSTER_NAME created successfully."
fi
docker ps

