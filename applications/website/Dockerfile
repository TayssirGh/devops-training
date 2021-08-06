FROM node:14 as build-stage

WORKDIR /app

COPY package.json package.json
RUN npm install
COPY . .
RUN npm run build
# npm run build nous génére des fichiers sous /app/dist/website


FROM nginx as serving-stage

# On copie les fichiers créés par le stage précédent (à travers la commande npm run build) dans notre
# Image Nginx qui ne contient que le serveur web Nginx
COPY  --from=build-stage /app/dist/website /usr/share/nginx/html
