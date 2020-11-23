apk add openrc --no-cache

apk update
mkdir /run/openrc
touch /run/openrc/softlevel
rc-status
apk add nginx
adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
apk add php7 php7-fpm
apk add php7-gd php7-mysqli php7-zlib php7-curl
cd /www
apk add php7 php7-fpm php7-opcache
apk add php7-gd php7-mysqli php7-zlib php7-curl php7-cgi php7-mbstring
apk add php7-pear php7-dev php7-zip php7-mcrypt php7-xml
apk add ssmtp tzdata php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc
apk add php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-pdo_pgsql
apk add php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader
apk add php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session

wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
rm phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv ../config.inc.php /www/phpmyadmin/config.inc.php
rc-status
rc-service nginx start
rc-service php-fpm7 start