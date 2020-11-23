FROM alpine:latest

RUN apk update \
&& apk add nginx \
&& mkdir /run/nginx
RUN   apk update \
&&    apk add curl \
&&    apk add gnupg \
&&    apk add dpkg \
&&    apk add supervisor
COPY  nginx-selfsigned.crt /etc/ssl
COPY  nginx-selfsigned.key /etc/ssl
COPY nginx.conf /etc/nginx/
COPY supervisord.conf /

COPY  pma.sh /
COPY  config.inc.php /
RUN   sh pma.sh

EXPOSE 5000

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/supervisord.conf"]