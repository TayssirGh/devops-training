ARG NODE_VERSION=14
ARG NGINX_VERSION=1.19.3-alpine

#stage : build

FROM node:${NODE_VERSION} as front_build

WORKDIR /usr/app

COPY . .

RUN npm install &&\
    npm run build --prod --output-path=dist

#stage nginx:

FROM nginx:${NGINX_VERSION} AS front

COPY .docker/nginx/default.conf /etc/nginx/conf.d

COPY .docker/nginx/docker-entrypoint.sh /docker-entrypoint.sh

COPY --from=front_build /usr/app/dist/website /qr-frontend


ENTRYPOINT [ "/docker-entrypoint.sh" ]

EXPOSE 80

CMD [ "nginx","-g","daemon off;" ]


