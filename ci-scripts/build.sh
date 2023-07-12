#!/usr/bin/env bash
cd ./applications
docker-compose build 
echo "build successful"
docker push oussachour/qr_python_code:latest
docker push oussachour/qr_frontend:latest
docker push oussachour/qr_backend:latest