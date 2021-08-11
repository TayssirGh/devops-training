#source : https://hub.docker.com/_/debian
FROM debian:latest
WORKDIR /debian 
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists/*
#COPY runner.sh and add execute permission 
USER  root
COPY runner.sh runner.sh
RUN chmod +x runner.sh 
ENTRYPOINT ./runner.sh