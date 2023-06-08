FROM node:16-alpine3.18 as backend

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install --legacy-peer-deps

COPY . .

CMD [ "node", "app.js" ]

