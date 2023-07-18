FROM python:3.9 

#creating app directory
WORKDIR /usr/src

#bundling app code  
COPY . .

#installing requirements
RUN pip install --upgrade pip \
    pip install --no-cache-dir -r requirements.txt

#running the app
EXPOSE 8420
CMD ["python", "-m", "uvicorn", "app:atom", "--host", "0.0.0.0", "--port", "8420"]
#CMD [ "python" , "app.py" ]