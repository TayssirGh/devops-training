cd training-app-deployment
bash seal-secrets.sh

# Using Kubctl
# kubectl apply -k base 

# for file in  sealed-secrets-*.yml ; do
#     kubectl apply -f $file
#     rm $file
# done

# Using Helm
helm install devops app-chart/