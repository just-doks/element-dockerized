FROM alpine:3.23

ARG GOMPLATE_VERSION=v5.0.0
# TODO: check this doesn't reinstall yq on every launch and use a builder if necessary
# RUN apk update && apk add yq bash envsubst

RUN apk add --no-cache yq bash envsubst ca-certificates curl

RUN curl -L "https://github.com/hairyhenderson/gomplate/releases/${GOMPLATE_VERSION}/download/gomplate_linux-amd64" -o /usr/local/bin/gomplate \
   && chmod +x /usr/local/bin/gomplate