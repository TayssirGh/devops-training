FROM node:14 AS website_build
WORKDIR /website
COPY . .
RUN  npm install
RUN npm run build --prod
#stage 2 : for production
FROM nginx:alpine
COPY --from=website_build /website/dist/website /usr/share/nginx/html
