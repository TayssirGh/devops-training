FROM node:14.15.0-alpine3.12 AS website

WORKDIR /app

COPY . .

RUN npm install

RUN npm build

CMD ["npm", "start"]

EXPOSE 4200