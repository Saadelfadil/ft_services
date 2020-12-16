FROM alpine

RUN		apk update
RUN		apk upgrade --available
RUN		apk add wget
RUN     apk add influxdb
RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz

RUN     tar -xzf telegraf-1.13.3-static_linux_amd64.tar.gz && \
            chmod +x telegraf/* && \
            cp telegraf/telegraf /usr/bin/ && \
            rm -rf *.tar.gz* telegraf/

ADD influxdb.conf /

COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY health.sh /

COPY    start.sh /

EXPOSE 8086

CMD     sh start.sh