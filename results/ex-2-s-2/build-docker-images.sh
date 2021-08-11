Docker run --rm -p 8420:4000 --env-file .env orcasifilus/t-003-qr

docker run --rm -p 81:3000 --env-file .env  orcasifilus/t-003-backend

docker run --rm -p 82:80 --mount type=bind,source="$(pwd)/src/assets/configs/app-config.json",target="/usr/share/nginx/html/assets/configs/app-config.json" website

docker build -t orcasifilus/t-003-backend -f Dockerfile .   devops-training/applications/backend

docker build -t orcasifilus/t-003-qr -f Dockerfile .    devops-training/applications/qr

docker build -t orcasifilus/t-003-website -f Dockerfile .   devops-training/applications/website

docker push orcasifilus/t-003-backend

docker push orcasifilus/t-003-qr

docker push orcasifilus/t-003-website

