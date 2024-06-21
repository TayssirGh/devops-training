ARG NODE_VERSION=16.20.2
# FROM node:${NODE_VERSION}-alpine as base
FROM node:alpine as base

WORKDIR /

COPY package*.json ./

RUN npm install
RUN npm install dotenv
RUN npm install mongodb

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
