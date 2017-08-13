# OpenSSL
#
# docker run --rm \
#            --interactive \
#            --tty \
#            -v "$(pwd):$(pwd)" \
#            -w $(pwd) \
#            muccg/openssl
#
FROM alpine:3.4
LABEL maintainer "https://github.com/muccg/"

RUN apk add --no-cache \
    openssl

RUN addgroup -g 1000 openssl \
    && adduser -D -h /data -H -S -u 1000 -G openssl openssl \
    && mkdir /data \
    && chown openssl:openssl /data

USER openssl
ENV HOME /data
WORKDIR /data

ENTRYPOINT ["/usr/bin/openssl"]
