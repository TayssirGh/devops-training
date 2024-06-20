### STAGE 1: Build ###
FROM node:alpine AS build

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm install
COPY . .

ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm run build 


### STAGE 2: Run ###
FROM nginx:alpine

COPY --from=build /usr/src/app/dist/website /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]