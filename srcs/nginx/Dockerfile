FROM alpine:latest
RUN apk update \
&& apk add nginx
RUN apk add openrc
RUN apk add openssl
RUN apk add openssh
RUN apk add --no-cache su-exec
ADD nginx.sh /
ADD index.html /
COPY  nginx-selfsigned.crt / 
COPY  nginx-selfsigned.key /
COPY telegraf.conf /etc/telegraf/telegraf.conf
ADD nginx.conf /
EXPOSE 80 443 22
ENTRYPOINT ["sh", "nginx.sh"]