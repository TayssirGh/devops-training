FROM node:16-alpine3.18 AS backend

WORKDIR /app

COPY package.json package.json

RUN npm install

COPY . .

CMD ["npm", "start"]