# # build stage
# FROM node:12-alpine as build-stage
# RUN apk add --no-cache git
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
