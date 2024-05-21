FROM node:16-alpine AS build
WORKDIR /app
COPY *.json /app/
RUN npm install
COPY . /app/
RUN npm run build 

FROM nginx:alpine
RUN apk add --no-cache iputils-ping
COPY --from=build /app/dist/website  /etc/nginx/html
EXPOSE 80
COPY ./nginx.conf /etc/nginx/conf.d/default.conf



