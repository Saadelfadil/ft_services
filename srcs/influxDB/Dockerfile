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

COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8086
COPY    start.sh /

CMD     sh start.sh