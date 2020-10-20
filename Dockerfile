FROM alpine:latest

ADD https://raw.githubusercontent.com/Saadelfadil/index.html/master/index.html /usr/share/nginx/html/

RUN chmod +r /usr/share/nginx/html/index.html

CMD ["nginx", "-g", "daemon off;"]