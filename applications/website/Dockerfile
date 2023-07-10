FROM node:12-alpine as node

WORKDIR /app

COPY package*.json ./

RUN npm install && npm install -g @angular/cli

COPY . .

RUN npm run build --prod

FROM nginx:alpine

COPY --from=node /app/dist/website /etc/nginx/html


COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 4200
