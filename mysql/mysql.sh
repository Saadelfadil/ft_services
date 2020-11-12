mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql
mysql_install_db --user=root > /dev/null

MYSQL_ROOT_PASSWORD=13371337
MYSQL_DATABASE=${MYSQL_DATABASE:-"db"}
MYSQL_USER=${MYSQL_USER:-"db"}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-"13371337"}

tfile=`mktemp`
cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
EOF
echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tfile
echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $tfile
/usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
rm -f $tfile
exec /usr/bin/mysqld --user=mysql --console