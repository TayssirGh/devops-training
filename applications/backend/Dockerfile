ARG NODE_VERSION=16.20.2
# FROM node:${NODE_VERSION}-alpine as base
FROM node:alpine as base

WORKDIR /

COPY package*.json ./

RUN npm install
RUN npm install dotenv
RUN npm install mongodb

COPY . .

ENV NODE_OPTIONS="--max-old-space-size=8192"

EXPOSE 3000

CMD ["npm", "start"]