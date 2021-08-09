FROM debian:9
USER root
COPY ./runner.sh runner.sh
RUN apt-get update  && apt-get install -y curl
RUN chmod +x ./runner.sh
ENTRYPOINT /runner.sh