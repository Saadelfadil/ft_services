FROM alpine:latest

RUN apk update \

&& apk add nginx \

&& mkdir /run/nginx

RUN   apk update \

&&    apk add curl \

&&    apk add gnupg \

&&    apk add dpkg \

&&    apk add supervisor

COPY  nginx-selfsigned.crt /

COPY  nginx-selfsigned.key /

COPY nginx.conf /etc/nginx/

COPY supervisord.conf /

COPY wp-config.php /

COPY health.sh /

COPY  wp.sh /

RUN   sh wp.sh

EXPOSE 5050

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/supervisord.conf"]