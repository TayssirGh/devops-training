#!/bin/bash

k3d cluster create comworkCluster --agents 1 --servers 1 -p 80:80@loadbalancer -p 443:443@loadbalancer -v $(pwd)/clusterData:/data

cd applications/training-app-deployment
chmod +x seal-secrets.sh
./seal-secrets.sh