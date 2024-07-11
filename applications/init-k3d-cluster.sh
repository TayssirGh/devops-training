#!/bin/bash

if ! command -v k3d &> /dev/null
then
    echo "k3d could not be found. Please install k3d and try again."
    exit
fi

CLUSTER_NAME="kube-training"


k3d cluster create $CLUSTER_NAME \
    --servers 1 \
    --agents 1 \
    --port 80:80@loadbalancer \
    --port 443:443@loadbalancer \
    --volume ~/cluster_data:/data

echo "Cluster $CLUSTER_NAME created successfully."


