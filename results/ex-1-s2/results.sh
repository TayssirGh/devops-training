#!/bin/bash
docker build -t  mghodben/t001-qr -f ../../applications/qr/Dockerfile ../../applications/qr/.
docker build -t  mghodben/t001-backend -f ../../applications/backend/Dockerfile ../../applications/backend/.
docker build -t mghodben/t001-website -f  ../../applications/website/Dockerfile .../../applications/website/.
docker run -d -p 8420:8420  mghodben/t001-qr
docker run -d -p 3000:3000 --env-file ./backend.env mghodben/t001-backend
docker run -d -p 4200:80 --mount type=bind,source="/home/marwen/Documents/devops-training/results/ex-1-s2/app-config.json",target="/website/app/assets/configs/app-config.json" mghodben/t001-website