#to build alpine image
docker build -t mghodben/t001-alpine -f alpine.Dockerfile .
#to run alpine image
docker run -d --env-file alpine.env mghodben/t001-alpine
#to build Debian image
docker build -t mghodben/t001-debian -f debian.Dockerfile .
#to run Debian image
docker run -d  --env-file alpine.env mghodben/t001-debian
#to build alpine image with entrypoint version
docker build -t mghodben/t001-alpine-environnement -f Dockerfile .
#to run alpine image with entrypoint version
docker run -d  --env-file alpine.env mghodben/t001-alpine-environnement

#docker push alpine image to docker hub
docker push mghodben/t001-alpine
#docker push debian image to docker hub
docker push mghodben/t001-debian
#docker push alpine-environnement image to docker hub
docker push mghodben/t001-alpine-environnement
