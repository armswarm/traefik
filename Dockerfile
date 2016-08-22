FROM armhf/alpine:latest

LABEL repository="https://github.com/armswarm/traefik"

ARG TRAEFIK_VERSION
ENV TRAEFIK_VERSION=${TRAEFIK_VERSION}

EXPOSE 80 443 8080

VOLUME ["/etc/traefik"]

RUN apk add --no-cache ca-certificates

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-arm /traefik

ENTRYPOINT ["/traefik"]
