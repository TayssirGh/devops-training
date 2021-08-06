FROM python:3 AS base
WORKDIR /app
USER root
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY . .
ENTRYPOINT /entrypoint.sh