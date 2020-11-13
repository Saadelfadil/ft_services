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
echo "CREATE USER IF NOT EXISTS 'sel-fadi'@'localhost' IDENTIFIED BY 'sel-fadi';" | mysql -uroot
echo "CREATE DATABASE sel_fadi_db;" | mysql -uroot
echo "grant all privileges on *.* TO 'sel-fadi'@'localhost' identified by 'sel-fadi';" | mysql -uroot
echo "flush privileges;" | mysql -uroot
rc-service mariadb restart
mysql -u root

# sleep 5

# cat << EOF > commands.sql
# USE mysql;
# CREATE USER 'sel_fadi'@'%';
# GRANT ALL PRIVILEGES ON sel_fadi_db.* TO 'sel-fadi'@'%' WITH GRANT OPTION;
# SET PASSWORD FOR 'sel-fadi'@'%' = PASSWORD('sel-fadi');
# FLUSH PRIVILEGES;
# EOF

# # Sending commands into mysql
# mysql -u root -e 'CREATE DATABASE sel_fadi_db;'
# mysql -u root wordpress < /wordpress.sql
# mysql -u root < commands.sql

# rm -f commands.sql

# rc-service mariadb restart





# MYSQL_ROOT_PASSWORD=sel-fadi
# MYSQL_DATABASE=${MYSQL_DATABASE:-"sel-fadi-db"}
# MYSQL_USER=${MYSQL_USER:-"sel-fadi"}
# MYSQL_PASSWORD=${MYSQL_PASSWORD:-"sel-fadi"}

# tfile=`mktemp`
# cat << EOF > $tfile
# USE mysql;
# FLUSH PRIVILEGES;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '';
# EOF
# echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tfile
# echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $tfile
# /usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
# rm -f $tfile
# exec /usr/bin/mysqld --user=mysql --console

# mysql -uroot
# mysql -e "CREATE USER IF NOT EXISTS 'sel-fadi@test' IDENTIFIED BY 'sel-fadi';"
# mysql -e "CREATE DATABASE sel_fadi_db;"
# mysql -e "USE sel_fadi_db;"
# mysql -e "grant all privileges on DATABASE_NAME.sel_fadi_db TO 'sel-fadi'@'localhost' identified by 'sel-fadi';"
# mysql -e "flush privileges;"
# mysql_upgrade -u root -p
# rc-service mariadb restart

# mysql -u root wordpress_db < /wordpress_db1.sql



# mysqladmin -u root password toor
# rc-service mysql stop
# kill  `cat /run/mysqld/mysqld.pid`
# /usr/bin/mysqld --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid --skip-grant-tables --skip-networking
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';FLUSH PRIVILEGES;ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';FLUSH PRIVILEGES;set password = password('MyNewPass');"
# kill  `cat /run/mysqld/mysqld.pid`
# rc-service mariadb restart
# sed -i "s|.*max_allowed_packet\s*=.*|max_allowed_packet = 100M|g" /etc/mysql/my.cnf
# sed -i "s|.*max_allowed_packet\s*=.*|max_allowed_packet = 100M|g" /etc/my.cnf.d/mariadb-server.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
# mysql_upgrade -u root -p
# rc-service mariadb restart
