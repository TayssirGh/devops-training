FROM alpine 

WORKDIR /app 

COPY runner.sh .

ENV WEBSITE_URL="google.com"
ENV SLEEP_DURATION=5 

RUN apk update
RUN apk add bash
RUN apk add curl

RUN  chmod +x runner.sh

ENTRYPOINT ["/bin/bash", "runner.sh"]