FROM    alpine

ENV GRAFANA_VERSION 7.0.5

RUN		apk add wget

RUN     apk add libc6-compat

RUN     apk add bash

RUN     apk add --no-cache su-exec ca-certificates openssl

RUN     apk add --no-cache --virtual .build-deps fontconfig

RUN		apk add wget

RUN     apk add curl

RUN		apk update

RUN		apk upgrade --available

RUN     wget -c https://dl.grafana.com/oss/release/grafana-7.0.5.linux-amd64.tar.gz

RUN addgroup grafana && \

    adduser -s /bin/false -G grafana -S -D grafana

RUN tar -xzf grafana-7.0.5.linux-amd64.tar.gz && \

        mv grafana-${GRAFANA_VERSION} /grafana && \

        mkdir -p /var/lib/grafana/dashboards /var/lib/grafana/data /var/lib/grafana/logs /var/lib/grafana/plugins && \

        ln -s /grafana/plugins /var/lib/grafana/plugins && \

        mv /grafana/bin/* /usr/bin/ && \

        grafana-cli plugins update-all && \

        rm -f /grafana/conf/*.ini grafana-7.0.5.linux-amd64.tar.gz && \
        
        apk del .build-deps

COPY grafana.db /grafana/data/

COPY  start.sh /

COPY health.sh /

COPY defaults.ini /grafana/conf/

EXPOSE 3000

CMD sh start.sh