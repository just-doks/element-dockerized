ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION}

ARG MAS_VERSION=v1.16.0

RUN apk add --no-cache bash curl tar \
    && mkdir -p /usr/local/bin  \
    && curl -fSL "https://github.com/element-hq/matrix-authentication-service/releases/download/${MAS_VERSION}/mas-cli-x86_64-linux.tar.gz" -o /tmp/mas-cli.tar.gz \
    && tar -xzf /tmp/mas-cli.tar.gz -C /usr/local/bin

