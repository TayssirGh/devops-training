FROM node:16 as build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx:latest

# Copy the build output to replace the default nginx contents.
COPY --from=build /app/dist/website /usr/share/nginx/html

# Expose port 80
EXPOSE 80