FROM debian

RUN apt-get update -y \
 && apt-get upgrade -y \
 && apt-get install -y curl \
 && rm -rf /var/cache/apt/*


COPY runner.sh /runner.sh
RUN chmod +x /runner.sh

ENTRYPOINT /runner.sh
