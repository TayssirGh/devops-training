FROM python:3.8.17-slim-buster AS qr

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt 

COPY . /app/

CMD ["uvicorn", "app:atom" "--host", "0.0.0.0" "--port", "8420"]

EXPOSE 8420