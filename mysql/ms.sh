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
echo "CREATE USER IF NOT EXISTS 'sel-fadi'@'192.168.99.114' IDENTIFIED BY 'sel-fadi';" | mysql -uroot
echo "CREATE DATABASE sel_fadi_db;" | mysql -uroot
echo "grant all privileges on *.* TO 'sel-fadi'@'192.168.99.114' identified by 'sel-fadi';" | mysql -uroot
echo "flush privileges;" | mysql -uroot
rc-service mariadb restart
mysql -u root

# sleep 5