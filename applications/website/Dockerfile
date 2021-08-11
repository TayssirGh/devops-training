FROM node:14 as build-stage

WORKDIR /app

COPY package.json package.json
RUN npm install
COPY . .
RUN npm run build

FROM nginx as serving-stage

COPY  --from=build-stage /app/dist/website /usr/share/nginx/html
