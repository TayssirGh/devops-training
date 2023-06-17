FROM python:3.9 as base

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "app:atom", "--host", "0.0.0.0", "--port", "8420"]

# Path: devops-training/applications/qr/Dockerfile
