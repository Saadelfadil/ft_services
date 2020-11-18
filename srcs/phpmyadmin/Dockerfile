FROM alpine:latest

RUN apk update \
&& apk add wget \
&& apk add tar \
&& apk add nginx \
&& mkdir /run/nginx
COPY  nginx-selfsigned.crt /etc/ssl
COPY  nginx-selfsigned.key /etc/ssl
COPY nginx.conf /etc/nginx/
COPY  pma.sh /

EXPOSE 5000
ENTRYPOINT [ "sh" , "pma.sh" ]