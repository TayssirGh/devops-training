FROM alpine:3.14
USER root
RUN apk update && apk add --no-cache bash &&  apk  add --no-cache curl
COPY ./runner.sh runner.sh
RUN chmod +x ./runner.sh
ENTRYPOINT /runner.sh