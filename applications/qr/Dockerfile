FROM python:alpine

WORKDIR /

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
# RUN pip install httptools==0.1.0 
RUN pip install uvloop

COPY . .


EXPOSE 8420

CMD ["uvicorn", "app:atom", "--host", "0.0.0.0", "--port", "8420"]