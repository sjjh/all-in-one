FROM haproxy:2.8.2-alpine3.18

USER root
RUN apk add --no-cache ca-certificates tzdata openssl curl bind-tools
USER haproxy:root

COPY --chmod=775 start.sh /start.sh
COPY --chmod=664 haproxy.cfg /haproxy.cfg

ENTRYPOINT ["/start.sh"]
HEALTHCHECK CMD [ $(curl https://127.0.0.1:2375/v1.41/_ping -ks) = "OK" ] || exit 1
