### STAGE 1: Build ###
FROM node:alpine AS build

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm install
COPY . .
# RUN export NODE_OPTIONS=--openssl-legacy-provider
# RUN NODE_OPTIONS=--openssl-legacy-provider npm run build

ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm run build 
### STAGE 2: Run ###
FROM nginx:alpine
# COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/website /usr/share/nginx/html

EXPOSE 80

# CMD to start nginx (assuming nginx default config will listen on port 80)
CMD ["nginx", "-g", "daemon off;"]