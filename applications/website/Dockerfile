FROM node:16-alpine AS build
WORKDIR /app
COPY *.json /app/
RUN npm install
COPY . /app/
RUN npm run build

FROM nginx:alpine
RUN apk add --no-cache iputils-ping
COPY --from=build /app/dist/website  /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

