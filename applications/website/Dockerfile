FROM node:14.15.0-alpine3.12 as website

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install --legacy-peer-deps

COPY . .

CMD ["npm", "run", "build"]