FROM alpine:latest

RUN apk update

RUN apk add openssl --no-cache

RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY pure-ftpd.pem /etc/ssl/private/

ADD ftps.sh /

COPY health.sh /

EXPOSE 21 30000-30001

ENTRYPOINT [ "sh", "ftps.sh" ]