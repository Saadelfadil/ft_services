influxd run -config /influxdb.conf &
influx -execute "create database telegraf"
influx -execute "CREATE USER admin WITH PASSWORD 'admin' WITH ALL PRIVILEGES"
/usr/bin/telegraf
tail -F /dev/null