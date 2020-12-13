chown -R grafana:grafana /grafana
exec su-exec grafana /usr/bin/grafana-server --homepath=/grafana

# influxd run -config /influxdb.conf &
# infulx -execute "create database telegraf"
# influx -execute "create user telegraf with password 'telegraf' with all privileges"
# exec /usr/bin/telegraf $@
# tail -F /dev/null