FROM nginx:latest

COPY default2.conf /etc/nginx/conf.d/default.conf
COPY --from=youssef2023/comwork-website /etc/nginx/html/   /etc/nginx/html/ 
