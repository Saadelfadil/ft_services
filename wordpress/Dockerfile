FROM alpine:latest

RUN apk update \
&& apk add nginx \
&& mkdir /run/nginx
RUN   apk update \
&&    apk add curl \
&&    apk add gnupg \
&&    apk add dpkg \
&&    apk add supervisor
ADD https://raw.githubusercontent.com/Saadelfadil/index.html/master/index.html /var/lib/nginx/html/
RUN chmod +r /var/lib/nginx/html/index.html
COPY  nginx-selfsigned.crt /etc/ssl
COPY  nginx-selfsigned.key /etc/ssl
COPY nginx.conf /etc/nginx/
COPY supervisord.conf /

COPY  wp.sh /
RUN   sh wp.sh

EXPOSE 80 443
ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/supervisord.conf"]