FROM node:21-alpine3.18
WORKDIR /app
COPY *.json /app
RUN npm install -g @angular/cli \
        && npm install
COPY . /app/
EXPOSE 4200
ENV NODE_OPTIONS=--openssl-legacy-provider
CMD ["ng","serve", "--host", "0.0.0.0"]
