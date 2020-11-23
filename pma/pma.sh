  adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
cp /nginx.conf /etc/nginx/nginx.conf
cp -a phpmyadmin /www/phpmyadmin
mkdir /run/openrc/
touch /run/openrc/softlevel
rc-status
rc-service -v php-fpm7 start
rc-service nginx start
tail -F /dev/null