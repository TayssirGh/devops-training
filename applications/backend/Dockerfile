FROM node:16.14.0-alpine3.14 as build

WORKDIR /app

COPY package*.json ./

RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]