FROM python:3.10-alpine3.16

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "app:atom", "--host", "0.0.0.0", "--port", "8420"]
