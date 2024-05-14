FROM node:20-alpine
RUN apk add --no-cache iputils-ping
WORKDIR /backend
COPY package.json package-lock.json ./
RUN npm install
COPY . /backend/
EXPOSE 3000
CMD ["npm", "start"]
