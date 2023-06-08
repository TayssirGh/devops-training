FROM python:3.8-slim-buster as qr

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "app:atom" , "--host 0.0.0.0", "--port", "8420"]