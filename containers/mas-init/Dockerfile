ARG MAS_VERSION=latest
FROM ghcr.io/element-hq/matrix-authentication-service:${MAS_VERSION} AS mas

ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION}

COPY --from=mas /usr/local/bin/mas-cli /usr/local/bin/mas-cli

RUN apk add --no-cache bash
