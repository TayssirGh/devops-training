 
#to build alpine image
docker build -t abdelkaderbrahem/t002-alpine -f alpine.Dockerfile .
#to run alpine image
docker run --rm --env-file .env abdelkaderbrahem/t002-alpine 
#to build Debian image
docker build -t abdelkaderbrahem/t002-debian -f debian.Dockerfile .
#to run Debian image
docker run --rm  --env-file .env abdelkaderbrahem/t002-debian 
#to build alpine image with entrypoint version
docker build -t abdelkaderbrahem/t002-alpine-env -f Dockerfile .
#to run alpine image with entrypoint version
docker run --rm  --env-file .env abdelkaderbrahem/t002-alpine-env