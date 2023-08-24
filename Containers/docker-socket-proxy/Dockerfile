FROM haproxy:2.8.2-alpine3.18

USER root
RUN apk add --no-cache ca-certificates tzdata curl bind-tools
USER haproxy:root

COPY --chmod=775 start.sh /start.sh
COPY --chmod=664 haproxy.cfg /conf/haproxy.cfg

ENTRYPOINT ["/start.sh"]
HEALTHCHECK CMD [ "$(curl http://127.0.0.1:2375/v1.41/_ping -s)" = "OK" ] || exit 1
