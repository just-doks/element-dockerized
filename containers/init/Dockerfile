FROM alpine:latest

# TODO: check this doesn't reinstall yq on every launch and use a builder if necessary
# RUN apk update && apk add yq bash envsubst

RUN apk add --no-cache yq bash envsubst ca-certificates curl \
 && curl -L https://github.com/hairyhenderson/gomplate/releases/latest/download/gomplate_linux-amd64 \
    -o /usr/local/bin/gomplate \
 && chmod +x /usr/local/bin/gomplate