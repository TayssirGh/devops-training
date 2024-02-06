FROM node:16 as app_ui_build

WORKDIR /ng-app/app-ui

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.13.9-alpine AS app_ui

COPY --from=app_ui_build /ng-app/app-ui/dist/website /usr/share/nginx/html

EXPOSE 80