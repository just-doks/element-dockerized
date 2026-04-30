FROM ghcr.io/element-hq/matrix-authentication-service AS mas

FROM alpine:3.23.4

COPY --from=mas /usr/local/bin/mas-cli /usr/local/bin/mas-cli

RUN apk add --no-cache bash
