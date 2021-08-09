FROM alpine:3.14 AS exercise_build
USER root
COPY ./entrypoint.sh entrypoint.sh
RUN chmod +x ./entrypoint.sh
ENTRYPOINT /entrypoint.sh
