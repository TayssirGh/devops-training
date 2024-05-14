FROM python:3.10
RUN apt-get update && apt-get install -y iputils-ping
WORKDIR /qr
COPY requirements.txt /qr/
RUN pip install --no-cache-dir -r requirements.txt
COPY . /qr
EXPOSE 8420
CMD ["uvicorn","app:atom", "--host", "0.0.0.0", "--port", "8420"]