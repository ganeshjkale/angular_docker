#Stage 1 compile source code 
FROM node:latest as build
MAINTAINER "GANESH KALE"
LABEL VERSION="1.0"
WORKDIR /usr/local/webapp
COPY sample-angular-app /usr/local/webapp/
#will install package dependency mentioned in .json files
RUN npm install
#will compile app
RUN npm run build

#Stage 2 run compile source code from stage1
FROM nginx:latest
#using stage 1 compiled app and copy to nginx default html
COPY --from=build /usr/local/webapp/dist/sample-angular-app /usr/share/nginx/html
#eposing nginx port 80 to docker host machine
EXPOSE 80
