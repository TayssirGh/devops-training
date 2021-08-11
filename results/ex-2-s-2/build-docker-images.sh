docker run --rm -p 82:80 --mount type=bind,source="$(pwd)/src/assets/configs/app-config.json",target="/usr/share/nginx/html/assets/configs/app-config.json" website

docker run --rm -p 8420:4000 --env-file .env qr

docker run --rm -p 81:3000 --env-file .env backend

docker build -t orcasifilus/t-003-qr -f Dockerfile .

docker push orcasifilus/t-003-qr

