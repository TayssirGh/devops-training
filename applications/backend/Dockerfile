FROM node:20-alpine
RUN apt-get update && apt-get install -y iputils-ping
WORKDIR /backend
COPY package.json package-lock.json ./
RUN npm install
COPY . /backend/
EXPOSE 3000
CMD ["npm", "start"]
