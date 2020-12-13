FROM alpine:latest

RUN apk update

RUN apk add openssl --no-cache

RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY pure-ftpd.pem /etc/ssl/private/
# COPY telegraf.conf /etc/telegraf/telegraf.conf
ADD ftps.sh /

EXPOSE 21 30000-30001

ENTRYPOINT [ "sh", "ftps.sh" ]