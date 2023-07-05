#importng the node (which also includes to package manager : npm)
FROM node:slim

#creating app directory
WORKDIR /usr/src

#environment variable : 

ENV QR_URL=http://172.17.0.4:8420/

#bundling app code 

COPY . .

#installing app dependencies 

RUN npm install

#running the app 

EXPOSE 3000
CMD [ "node" , "index.js" ]