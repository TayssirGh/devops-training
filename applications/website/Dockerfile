# stage 1 : building the app
FROM node:14 AS website_build
WORKDIR /website
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm i
COPY . .
RUN npm run build --prod
#stage 2 : for production
FROM nginx:latest
COPY --from=website_build /website/dist/website /usr/share/nginx/html
