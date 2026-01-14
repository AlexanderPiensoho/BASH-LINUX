FROM alpine:3.23

RUN apk add --no-cache \
    bash \
    netcat-openbsd \
    tini

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 700 /entrypoint.sh

EXPOSE 5555

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/entrypoint.sh"]
