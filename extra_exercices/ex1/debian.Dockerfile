FROM debian

RUN apt-get update -y && apt-get install -y curl

COPY runner.sh /runner.sh
ENTRYPOINT /runner.sh
