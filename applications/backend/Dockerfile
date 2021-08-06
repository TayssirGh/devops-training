FROM node:14
WORKDIR /backend
COPY package.json package.json
RUN npm i
COPY . .
EXPOSE 3000
CMD [ "node", "index.js" ]