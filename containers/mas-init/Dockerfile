ARG MAS_VERSION=latest
ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache bash curl tar
RUN curl -sL "https://github.com/element-hq/matrix-authentication-service/releases/download/${MAS_VERSION}/mas-cli-x86_64-linux.tar.gz" \
    | tar -xz -C /usr/local/bin/

