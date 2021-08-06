Build images :

docker build -t backend -f Dockerfile .

docker run --rm -p 3200:5000 --env-file .env qr

