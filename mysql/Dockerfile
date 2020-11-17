FROM alpine:latest

RUN apk update openrc
RUN apk add mysql mysql-client
COPY my.cnf /etc/mysql/my.cnf
COPY ms.sh /
# RUN   sh ms.sh
COPY supervisord.conf /

EXPOSE 3306
CMD sh ms.sh
# ENTRYPOINT  ["sh ms.sh"]
ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/supervisord.conf"]