FROM node:14.15.0-alpine3.12 AS website

WORKDIR /app

COPY . .

RUN npm install -g @angular/cli@7.3.9

RUN npm install

RUN npm build

CMD ["ng", "serve", "--host", "0.0.0.0"]