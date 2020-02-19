FROM node:alpine

WORKDIR /usr/app

COPY ./package.json ./

RUN npm install

COPY ./ ./

CMD ["npm","start"]

# docker build -t gauravjain449/backendnode .
# docker run -P -d gauravjain449/backendnode