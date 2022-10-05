# builder image
FROM alpine:latest

ARG HUGO_BASEURL
ENV HUGO_BASEURL ${HUGO_BASEURL:-http://localhost:1234}
ENV HUGO_VERSION 0.101.0

LABEL description="gohugo build"
LABEL version="1.0"
LABEL maintainer="jholdstock@decred.org"

WORKDIR /tmp

RUN apk update && apk upgrade
RUN apk add --no-cache bash jq wget libc6-compat g++
RUN wget -q https://github.com/gohugoio/hugo/releases/download/v$HUGO_VERSION/hugo_extended_"$HUGO_VERSION"_Linux-64bit.tar.gz
RUN tar xz -C /usr/local/bin -f hugo_extended_"$HUGO_VERSION"_Linux-64bit.tar.gz

WORKDIR /root

COPY ./ /root/

RUN bin/build-hugo.sh

# final image
FROM nginx:1.22

LABEL description="brweb server"
LABEL version="1.0"
LABEL maintainer="jholdstock@decred.org"

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# /usr/share/nginx/html is also hardcoded in test/run-test.sh
COPY --from=0 /root/src/public/ /usr/share/nginx/html