FROM alpine

RUN apk add --no-cache --virtual ce-dependencies \
    git \
    build-base \
    npm

RUN npm install --global git+https://github.com/compiler-explorer/compiler-explorer.git

WORKDIR /usr/lib/node_modules/compiler-explorer/

RUN make dist

RUN adduser -D -u 1000 ce
USER ce

EXPOSE 10240

CMD make run

