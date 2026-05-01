FROM debian:trixie-slim

ARG MAS_VERSION=v1.16.0

RUN apt update \
    && apt install -y --no-install-recommends ca-certificates curl tar \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fSL "https://github.com/element-hq/matrix-authentication-service/releases/download/${MAS_VERSION}/mas-cli-x86_64-linux.tar.gz" \
    | tar -xz -C /usr/local/bin/

