#!/bin/bash
# DB_DATA_PATH="/var/lib/mysql"

# if [  -d $DB_ROOT_PATH  ]
# then

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
echo "  use wordpress ; source /wordpress.sql ;flush privileges;" | mysql -uroot
mysql -u root < phpmyadmin.sql
mysql -u root < wordpress.sql
rc-service mariadb restart
mysql -u root
tail -F /dev/null

# fi

# /etc/init.d/mariadb start



# DB_DATA_PATH="/var/lib/mysql"
# DB_USER="admin"
# DB_PASS="admin"
# DB_ROOT_PASS="admin"
# ​
# ​
# ​
# if [  -d $DB_ROOT_PATH  ]
# then
# ​
# mkdir -p /var/lib/mysql
# ​
# /usr/bin/mysql_install_db --user=mysql
# /usr/bin/mysqld_safe --datadir="/var/lib/mysql"
# rc-status
# /etc/init.d/mariadb setup
# /etc/init.d/mariadb start
# sleep 7
# mysqladmin -u root password "${DB_ROOT_PASS}"
# mysql -u root -e "CREATE DATABASE wordpress;"
# mysql -u root -e "CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${DB_PASS}';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO ${DB_USER}@'%';"
# mysql -u root -e "use wordpress; source /wordpress.sql ;"
# mysql -u root -e "FLUSH PRIVILEGES;"
# ​
# /etc/init.d/mariadb stop
# fi
# ​
# /etc/init.d/mariadb start