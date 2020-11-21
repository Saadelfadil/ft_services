!/bin/sh
influxd run &
influx -execute "create database telegraf"
influx -execute "create user telegraf with password 'telegraf' with all privileges"
exec /usr/bin/telegraf
tail -F /dev/null