FROM node:16 as build

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/

VOLUME /usr/src/tmp

RUN npm install
RUN npm run build 
EXPOSE 3000

COPY . /usr/src/app

ENV NODE_ENV production
ENV PORT 3000
ENV PUBLIC_PATH "/"
# Main command
CMD [ "npm", "run", "start" ]