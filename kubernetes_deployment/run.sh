#!/bin/bash



sudo kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.22.0/controller.yaml
sudo kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml

# sudo kubectl wait --namespace kube-system \
#  --for=condition=ready pod \
#  --selector=app.kubernetes.io/component=controller \
#  --timeout=-1s

sudo kubectl wait --namespace ingress-nginx \
 --for=condition=ready pod \
 --selector=app.kubernetes.io/component=controller \
 --timeout=-1s


sudo kubectl apply -f -

sudo kubectl apply -k .

# POD_NAME=$(kubectl get pods -n training-app-backend-prod --selector=app=backend -o jsonpath='{.items[0].metadata.name}')
# kubectl cp ./tmp/api.js training-app-backend-prod/$POD_NAME:/app/config/api.js -c backend -n training-app-backend-prod

# chmod +x seals.sh
# ./seals.sh