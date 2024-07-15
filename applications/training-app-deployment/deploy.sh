#!/bin/bash
# shellcheck disable=SC2164
cd applications/training-app-deployment
export KUBECONFIG=/home/tayssir/.kube/config
kubectl version
kubectl apply -f namespaces.yaml
kubectl apply -f ./
