FROM debian:9
USER root
RUN apt-get update -y && apt-get install -y curl
COPY ./runner.sh runner.sh
RUN chmod +x ./runner.sh
ENTRYPOINT /runner.sh