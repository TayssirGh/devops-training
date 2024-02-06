FROM python:3.9 as python_api

WORKDIR /app

COPY . /app

RUN apt update && apt upgrade -y && \
	pip install --no-cache-dir -r requirements.txt && \
	rm -rf /var/lib/apt/lists/*


CMD ["uvicorn", "app:atom", "--host", "0.0.0.0", "--port", "8000"]