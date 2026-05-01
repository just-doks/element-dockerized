FROM debian:trixie-slim

ARG GOMPLATE_VERSION=v5.0.0
# TODO: check this doesn't reinstall yq on every launch and use a builder if necessary
# RUN apk update && apk add yq bash envsubst

RUN apt update \
    && apt install -y --no-install-recommends ca-certificates curl yq gettext-base \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fSL "https://github.com/hairyhenderson/gomplate/releases/${GOMPLATE_VERSION}/download/gomplate_linux-amd64" -o /usr/local/bin/gomplate \
   && chmod +x /usr/local/bin/gomplate