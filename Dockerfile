FROM armhf/alpine:latest
MAINTAINER armswarm

# metadata params
ARG PROJECT_NAME
ARG BUILD_DATE
ARG VCS_URL
ARG VCS_REF

# metadata
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name=$PROJECT_NAME \
      org.label-schema.url=$VCS_URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vendor="armswarm" \
      org.label-schema.version="latest"

ARG TRAEFIK_VERSION
ENV TRAEFIK_VERSION=${TRAEFIK_VERSION}

EXPOSE 80 443 8080

VOLUME ["/etc/traefik"]

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-arm /traefik

RUN \
 apk add --no-cache ca-certificates && \

 chmod a+x /traefik

ENTRYPOINT ["/traefik"]
