FROM python:3.10

WORKDIR /

COPY requirements.txt ./

RUN apt-get update && apt-get install -y iputils-ping
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

EXPOSE 8420

CMD ["uvicorn", "app:atom", "--host", "0.0.0.0", "--port", "8420"]