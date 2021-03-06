FROM alpine:3.8

RUN apk add --no-cache bash outils-md5 coreutils

COPY docker/htpasswd-updater.sh /htpasswd-updater.sh

RUN chmod a+x /htpasswd-updater.sh

CMD ["/htpasswd-updater.sh"]
