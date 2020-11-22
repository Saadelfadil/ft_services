#!/bin/zsh
kubectl delete deploy influxdb
kubectl delete persistentvolumeclaims influxdb-pv-claim
kubectl delete svc influxdb