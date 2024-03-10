FROM node:14.15.0-alpine3.12 as website

WORKDIR /app

COPY package.json /app/package.json

RUN npm install

COPY . .

RUN npm run build --prod

FROM nginx:alpine 

COPY --from=website /app/dist/website /usr/share/nginx/html
