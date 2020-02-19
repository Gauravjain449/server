FROM node:alpine

WORKDIR /usr/app

COPY ./ ./

RUN npm install

CMD ["npm","start"]

# docker build -t gauravjain449/backendnode .
# docker run -P -d gauravjain449/backendnode