FROM python:3

WORKDIR /applications
ENV APP_PORT "8420"

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD ["bash", "-c", "uvicorn app:atom --host 0.0.0.0 --port "$APP_PORT""]