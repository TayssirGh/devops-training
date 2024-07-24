FROM debian:stable 

WORKDIR /app 

COPY runner.sh .

ENV WEBSITE_URL="google.com"
ENV SLEEP_DURATION=5 

RUN apt-get update
RUN apt-get -y install curl
RUN  chmod +x runner.sh

ENTRYPOINT ["/bin/bash", "runner.sh"]