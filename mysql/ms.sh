apk add openrc --no-cache
mkdir /run/openrc
touch /run/openrc/softlevel
rc-status

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

mysql_install_db --user=mysql --datadir=/var/lib/mysql
/etc/init.d/mariadb setup
rc-service mariadb start
mysqladmin -u root password toor
rc-service mysql stop
# kill  `cat /run/mysqld/mysqld.pid`
# /usr/bin/mysqld --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid --skip-grant-tables --skip-networking
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';FLUSH PRIVILEGES;ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';FLUSH PRIVILEGES;set password = password('MyNewPass');"
# kill  `cat /run/mysqld/mysqld.pid`
# rc-service mariadb restart
# sed -i "s|.*max_allowed_packet\s*=.*|max_allowed_packet = 100M|g" /etc/mysql/my.cnf
# sed -i "s|.*max_allowed_packet\s*=.*|max_allowed_packet = 100M|g" /etc/my.cnf.d/mariadb-server.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=127.0.0.1|g" /etc/mysql/my.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=127.0.0.1|g" /etc/my.cnf.d/mariadb-server.cnf
mysql_upgrade -u root -p
rc-service mariadb restart
