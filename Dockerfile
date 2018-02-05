FROM quay.io/armswarm/alpine:3.7

ARG TRAEFIK_VERSION
ENV TRAEFIK_VERSION=${TRAEFIK_VERSION}

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-arm /usr/local/bin/traefik

RUN \
  apk add --no-cache ca-certificates \
  && chmod a+x /usr/local/bin/traefik

COPY entrypoint.sh /

EXPOSE 80 443 8080

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "--help" ]
