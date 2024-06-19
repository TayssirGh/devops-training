FROM node:21-alpine3.18
WORKDIR /app
COPY *.json /app
RUN npm install
COPY . /app/
CMD ["ng","serve"]
