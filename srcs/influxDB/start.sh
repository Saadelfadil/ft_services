!/bin/sh
# influxd run -config /influxdb.conf &
influxd &
# influx -execute "create database influxdb"
influx -execute "create user admin with password 'admin' with all privileges"
exec /usr/bin/telegraf
tail -F /dev/null