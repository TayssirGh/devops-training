FROM python:3.9 as qr

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8420

CMD [ "uvicorn", "app:atom", "--host", "0.0.0.0","--port", "8420" ,"--reload"]