FROM node:alpine

COPY ./ ./

RUN npm install

CMD ["npm","start"]

# docker build -t gauravjain449/backendnode .
# docker run -P -d gauravjain449/backendnode