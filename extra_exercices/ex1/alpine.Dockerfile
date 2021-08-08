#source : https://hub.docker.com/_/alpine
FROM alpine:3.14
WORKDIR  /alpine
RUN apk update && apk add --no-cache bash curl 
#config runner.sh file to be executable 
USER  root
COPY runner.sh runner.sh
RUN chmod +x runner.sh
#add bash and curl to run  runner.sh script  
ENTRYPOINT ./runner.sh


