FROM node:14
WORKDIR /backend
COPY . .
COPY package.json package.json
RUN npm i
EXPOSE 3000
CMD [ "node", "index.js" ]