# stage 1 : building the app 
FROM node:14 AS website_build
WORKDIR /website
COPY package.json package.json
RUN  npm install 
COPY . .
RUN npm run build --prod

#stage 2 : for production 
FROM nginx:alpine
COPY --from=website_build /website/dist/website /usr/share/nginx/html

