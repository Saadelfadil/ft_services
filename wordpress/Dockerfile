FROM alpine:latest

RUN   apk update \
&&    apk add curl \
&&    apk add gnupg \
&&    apk add dpkg
COPY  wordpress.sh /
RUN   sh wordpress.sh

# CMD ["nginx", "-g", "daemon off;"]
