# Stage 1: Build website
FROM node:14 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


# Stage 2: Serve website with Nginx

FROM nginx:alpine

COPY /nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist/website /usr/share/nginx/html

EXPOSE 80
