FROM debian:stable

RUN apt-get update && \
    apt-get install -y curl

COPY runner.sh /usr/local/bin/runner.sh

RUN chmod +x /usr/local/bin/runner.sh

ENV WEBSITE_URL="http://google.com"
ENV SLEEP_DURATION=10

ENTRYPOINT ["/usr/local/bin/runner.sh"]
