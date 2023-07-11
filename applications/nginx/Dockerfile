FROM nginx:latest
RUN chmod 777 default2.conf
COPY default2.conf /etc/nginx/conf.d/default.conf
COPY --from=youssef2023/comwork-website:latest /etc/nginx/html/   /etc/nginx/html/ 
