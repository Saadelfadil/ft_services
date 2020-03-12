FROM alpine
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
&& apk update \
&& apk add pure-ftpd \
&& adduser -D sel-fadi \
&& echo "sel-fadi:sel-fadi" | chpasswd
COPY pure-ftpd.pem etc/ssl/private/
RUN chmod 600 /etc/ssl/private/pure-ftpd.pem
COPY setup.sh /
EXPOSE 21 21000:21010
ENTRYPOINT ["sh" ,"setup.sh"]