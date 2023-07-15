#!/bin/bash

sudo k3d cluster delete clusster

sudo k3d cluster create --config create_cluster.yaml
