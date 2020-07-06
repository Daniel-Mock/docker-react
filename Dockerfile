FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx

#EXPOSE added for AWS Elastic Beanstalk
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
