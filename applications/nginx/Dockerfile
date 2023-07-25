ARG NGINX_VERSION=1.19.3-alpine
FROM nginx:${NGINX_VERSION}

RUN rm /etc/nginx/conf.d/default.conf

#COPY nginx.conf /etc/nginx/conf.d
#nginx redirecting http traffic to https  
COPY nginx-tls.conf /etc/nginx/conf.d
