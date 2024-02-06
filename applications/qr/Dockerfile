FROM python:3.9 AS qr_api

ENV WERKZEUG_RUN_MAIN=true \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    API_PYTHON_HOST=0.0.0.0 \
    API_PYTHON_PORT=8420

COPY ./ /qr_api

WORKDIR /qr_api

RUN apt update && apt upgrade -y && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf /var/lib/apt/lists/*

CMD ["uvicorn", "app:atom", "--host", "0.0.0.0", "--port", "8420"]