FROM node:9.5.0-alpine

ENV WORKDIR /server
ENV PORT 8080

WORKDIR ${WORKDIR}

COPY package.json ${WORKDIR}
COPY package-lock.json ${WORKDIR}

RUN apk add --no-cache --virtual .gyp python make g++
RUN npm install --production
RUN apk del .gyp

COPY server.js ${WORKDIR}

CMD ["node", "."]

EXPOSE ${PORT}