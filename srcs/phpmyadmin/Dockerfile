FROM alpine:latest

RUN apk update \
&& apk add wget supervisor \
&& apk add tar \
&& apk add nginx \
&& mkdir /run/nginx
COPY  nginx-selfsigned.crt /etc/ssl
COPY  nginx-selfsigned.key /etc/ssl
COPY nginx.conf /etc/nginx/
COPY  pma.sh /
COPY supervisord.conf /

EXPOSE 5000


RUN sh pma.sh



ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/supervisord.conf"]