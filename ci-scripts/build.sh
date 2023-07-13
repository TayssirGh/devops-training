#!/usr/bin/env bash
chmod u+x ./ci-scripts/build.sh 

cd ./applications
echo "troubelshooting:before build"
docker-compose -f docker-compose.yml build 
echo "troubelshooting:build successful"
  
docker push oussachour/qr_python_code:latest

  
docker push oussachour/qr_frontend:latest

 
docker push oussachour/qr_backend:latest