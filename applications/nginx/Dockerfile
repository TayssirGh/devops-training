FROM nginx:latest

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY localhost.crt /etc/nginx/localhost.crt

COPY localhost.decrypted.key /etc/nginx/localhost.decrypted.key

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]