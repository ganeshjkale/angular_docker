#Stage 1 compile source code 
FROM node:latest as build
MAINTAINER "GANESH KALE"
LABEL VERSION="1.0"
WORKDIR /usr/local/webapp
COPY sample-angular-app /usr/local/webapp/
RUN npm install
RUN npm run build

#Stage 2 run compile source code from stage1
FROM nginx:latest
COPY --from=build /usr/local/webapp/dist/sample-angular-app /usr/share/nginx/html
EXPOSE 80
