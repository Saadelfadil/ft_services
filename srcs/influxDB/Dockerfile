FROM alpine

RUN		apk update
RUN		apk upgrade --available

RUN     apk add influxdb

EXPOSE 8086

COPY    start.sh /

CMD     sh start.sh