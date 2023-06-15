FROM node:14.15.0-alpine3.12 AS website

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build --prod

FROM nginx:latest
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=website /app/dist/website /app