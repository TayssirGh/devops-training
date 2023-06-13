FROM node:14.15.0-alpine3.12 as website

WORKDIR /app

COPY package.json /app/package.json

RUN npm install

RUN npm install -g @angular/cli@7.3.9

COPY . .

CMD [ "ng", "serve", "--host", "0.0.0.0"]
#CMD ng serve --host 0.0.0.0