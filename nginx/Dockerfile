FROM alpine:latest
RUN apk update \
&& apk add nginx \
&& mkdir /run/nginx
# && echo "<h1>Hello world!</h1>" > /var/www/localhost/htdocs/index.html;
ADD https://raw.githubusercontent.com/Saadelfadil/index.html/master/index.html /var/www/localhost/htdocs/
RUN chmod +r /var/www/localhost/htdocs/index.html
COPY  nginx-selfsigned.crt /etc/ssl 
COPY  nginx-selfsigned.key /etc/ssl
ADD default.conf /etc/nginx/conf.d/default.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
# EXPOSE 80 443
ENTRYPOINT ["nginx"]