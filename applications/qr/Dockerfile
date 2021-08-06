FROM python:3 AS base
WORKDIR /app
USER root
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

FROM base AS app
ENV APP_PORT "8420"
COPY . .
COPY --from=base /entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh