#!/bin/bash

k3d cluster create comwork --agents 1 --servers 1 -p 80:80@loadbalancer -p 443:443@loadbalancer -v $(pwd)/clusterData:/data
echo "_______________________________________________________________________________________"

echo "cluster creation passed successfully !!!!!!!!!!!!!!!!!!!!!"

echo "_______________________________________________________________________________________"

cd applications/training-app-deployment
chmod +x seal-secrets.sh
./seal-secrets.sh