#!/usr/bin/env bash
chmod u+x ./ci-scripts/build.sh 

cd ./applications
echo "before build"
docker-compose build 
echo "build successful"
docker push oussachour/qr_python_code:latest
docker push oussachour/qr_frontend:latest
docker push oussachour/qr_backend:latest