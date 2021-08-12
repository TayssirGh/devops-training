FROM python:3
WORKDIR /app
USER root
COPY requirements.txt requirements.txt
ENV APP_PORT "8420"
RUN pip3 install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh