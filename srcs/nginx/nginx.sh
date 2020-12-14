adduser -D  www
echo "admin:admin" | chpasswd
mkdir /www
chown -R u+wrx /var/lib/nginx
chown -R u+wrx /www
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
cp /nginx.conf /etc/nginx/nginx.conf
cp index.html /www/index.html
mkdir /run/openrc/
touch /run/openrc/softlevel
rc-status
rc-service nginx start
rc-service sshd start
tail -F /dev/null