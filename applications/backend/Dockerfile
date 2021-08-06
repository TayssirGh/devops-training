FROM node:14

WORKDIR /app

COPY package.json package.json
RUN npm i

COPY . .

CMD ["node", "index.js"]