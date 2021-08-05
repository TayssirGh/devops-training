FROM debian:9
USER root
WORKDIR /debian
RUN apt-get update  && apt-get install -y curl
COPY . .
RUN chmod +x ./runner.sh
ENTRYPOINT ./runner.sh