FROM alpine 

WORKDIR /app 

COPY runner.sh .
COPY entrypoint.sh .

RUN apk update
RUN apk add bash
RUN apk add curl

RUN  chmod +x entrypoint.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]