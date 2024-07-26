FROM node:alpine AS build
WORKDIR /app
COPY *.json /app
RUN npm install
COPY . /app/
EXPOSE 4200
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist/website /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
