# Inspiration: https://github.com/Tecnativa/docker-socket-proxy/blob/master/Dockerfile
FROM haproxy:2.8.2-alpine3.18

USER root

RUN set -ex; \
    apk add --no-cache tzdata; \
    chmod 777 -R /run/; \
    chmod 777 -R /var/lib/haproxy

EXPOSE 2375
ENV ALLOW_RESTARTS=1 \
    AUTH=1 \
    BUILD=0 \
    COMMIT=0 \
    CONFIGS=0 \
    CONTAINERS=1 \
    DISTRIBUTION=0 \
    EVENTS=0 \
    EXEC=0 \
    GRPC=0 \
    IMAGES=1 \
    INFO=1 \
    LOG_LEVEL=info \
    NETWORKS=1 \
    NODES=0 \
    PING=1 \
    PLUGINS=0 \
    POST=1 \
    SECRETS=0 \
    SERVICES=0 \
    SESSION=0 \
    SOCKET_PATH=/var/run/docker.sock \
    SWARM=0 \
    SYSTEM=0 \
    TASKS=0 \
    VERSION=1 \
    VOLUMES=1
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

USER root

HEALTHCHECK CMD nc -z 127.0.0.1 2375 || exit 1
