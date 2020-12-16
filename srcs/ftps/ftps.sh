mkdir -p /ftps/admin

openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -subj "/C=MO/ST=Souss Massa/L=agadir/O=1337/CN=saad" -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
chmod 600 /etc/ssl/private/pure-ftpd.pem

adduser -D admin
echo "admin:admin" | chpasswd
/usr/sbin/pure-ftpd -j -Y 2  -p 30000:30000 -p 30001:30001 -P "192.168.99.224"
# exec /usr/bin/telegraf
