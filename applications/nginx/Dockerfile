FROM nginx:latest

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY localhost.crt /etc/nginx/localhost.crt

COPY localhost.key /etc/nginx/localhost.key

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
