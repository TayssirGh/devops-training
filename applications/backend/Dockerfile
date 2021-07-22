FROM node:14
WORKDIR /backend
COPY . .
COPY ./config/.env  /.env
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD [ "node", "index.js" ]
