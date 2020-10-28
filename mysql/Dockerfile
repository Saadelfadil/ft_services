FROM alpine:latest

RUN   apk update
COPY  Mysqlinstall.sh /
RUN   sh Mysqlinstall.sh
COPY  Mysqlconfig.sh /
RUN   sh Mysqlconfig.sh