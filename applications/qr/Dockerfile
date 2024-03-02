ARG PYTHON_VERSION=3.13.0a4-slim-bookworm

FROM python:${PYTHON_VERSION}} as QR

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD ["uvicorn", "app:atom", "--host", "0.0.0.0", "--port", "8420"]
