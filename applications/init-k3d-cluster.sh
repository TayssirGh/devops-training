#!/bin/bash

k3d cluster create comwork --agents 1 --servers 1 -p 80:80@loadbalancer -p 443:443@loadbalancer -v $(pwd)/clusterData:/data

- echo "____________________________________________________________"
- echo "init-k3d-cluster.sh finished successfully"
- echo "____________________________________________________________"