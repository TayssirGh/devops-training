FROM node:14.20.0-alpine

WORKDIR /front

COPY package*.json ./

RUN npm install

COPY . .

CMD [ "npm", "start"]