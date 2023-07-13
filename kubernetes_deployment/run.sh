
sudo kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml

sudo kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.22.0/controller.yaml

sudo kubectl wait --namespace kube-system \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=-1s

sudo kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=-1s

# sudo bash seal-secret.sh k8s-secret-backend k8s-secret-qr

sudo kustomize build | kubectl apply -f -

