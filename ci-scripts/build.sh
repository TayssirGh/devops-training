#!/usr/bin/env bash
cd ./applications
echo "before build"
docker-compose build 
echo "build successful"
docker push oussachour/qr_python_code:latest
docker push oussachour/qr_frontend:latest
docker push oussachour/qr_backend:latest