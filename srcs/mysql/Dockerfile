FROM alpine:latest

RUN apk update openrc
RUN apk add mysql mysql-client
COPY my.cnf /etc/mysql/my.cnf
COPY ms.sh /

EXPOSE 3306
CMD sh ms.sh