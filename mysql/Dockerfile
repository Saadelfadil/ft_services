FROM alpine:latest


RUN apk add mariadb openrc
COPY my.cnf /etc/mysql/my.cnf
COPY ms.sh /
RUN   sh ms.sh

EXPOSE 5000