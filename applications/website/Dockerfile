FROM node:16.14.0 as build

WORKDIR /app

COPY package-lock.json package.json ./

RUN npm install 

RUN npm install -g @angular/cli

COPY . .

RUN npm run build --prod

FROM nginx:alpine

COPY --from=build /app/dist/website /usr/share/nginx/html


COPY /nginx.conf /etc/nginx/conf.d/default.conf
