#!bin/bash

cd training-app-deployment/helm-chart

k3d cluster delete dev

k3d cluster create --config ../config.yml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml

kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.22.0/controller.yaml

kubectl wait --namespace kube-system \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=-1s

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=-1s

subst_with_sealed(){

  declare -A content

  while IFS="=" read -r key value; do content["$key"]=$value; done < <(
    yq '.secrets['$1'].values | to_entries | map([.key, .value] | join("=")) | .[]' values.yaml
  )

  for key in "${!content[@]}";
  do
  value=${content[$key]}
  if [[ $value = ENV_* ]];
  then
    envname=$(printenv ${value:4})
    sealedValue=$(echo -n $envname | kubeseal --raw --name $2 --namespace training-app-backend-prod --from-file=/dev/stdin)
  else
    sealedValue=$(echo -n $value | kubeseal --raw --name $2 --namespace training-app-backend-prod --from-file=/dev/stdin)
  fi
  yq -i '.secrets['$1'].values.'$key' = "'$sealedValue'"' values.yaml
  done

}

subst_with_sealed 0 backend-secret
subst_with_sealed 1 qr-secret

helm install devops .