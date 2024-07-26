FROM node:21-alpine3.18
WORKDIR /backend
COPY package*.json ./
RUN npm install
COPY . /backend/
EXPOSE 3000
CMD ["npm","start"]

