FROM alpine:latest

RUN apk update openrc
RUN apk add mysql mysql-client
COPY my.cnf /etc/mysql/my.cnf
COPY my.cnf /etc/my.cnf
COPY ms.sh /
COPY phpmyadmin.sql /
COPY wordpress.sql /
EXPOSE 3306
ENTRYPOINT ["sh","ms.sh"]