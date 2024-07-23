#!/bin/bash

k3d cluster create training-cluster --agents 1 --servers 1 -p 80:80@loadbalancer -p 443:443@loadbalancer -v ./clusterData:/data