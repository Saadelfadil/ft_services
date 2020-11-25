apk add openrc --no-cache
mkdir /run/openrc
touch /run/openrc/softlevel
rc-status
mkdir -p /app/mysql
mkdir -p /run/mysqld
chown -R mysql:mysql /app/mysql


mysql_install_db --user=mysql --datadir=/app/mysql
/etc/init.d/mariadb setup
pkill mysql
pkill mysqld
service mariadb restart
echo "CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -uroot
echo "CREATE DATABASE wordpress;" | mysql -uroot
echo "grant all privileges on *.* TO 'admin'@'%' identified by 'admin';" | mysql -uroot
echo "flush privileges;" | mysql -uroot
echo "------------------------------------"
mysql -u root < phpmyadmin.sql
mysql -u root < wordpress.sql
rc-service mariadb restart
mysql -u root
tail -F /dev/null
# sleep 5