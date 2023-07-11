#!/bin/bash
docker-compose -f docker-compose-C.yml up -d --build --force-recreate
#rm -r tmp
#docker cp applications_website_1:/etc/nginx/html/ ./tmp
#cd tmp
#docker cp . load_balancer:/etc/nginx/html/
