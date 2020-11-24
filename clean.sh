#!/bin/bash
# Colors
Color_Off='\033[0m'       # Text Reset
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

echo "${Cyan}-------------------------------- Nginx ------------------------------------------${Color_Off}"
kubectl delete deployment nginx
kubectl delete services nginx
echo  "\n"

echo "${Cyan}------------------------------- Mysql -------------------------------------------${Color_Off}"
kubectl delete deployment/mysql
kubectl delete services/mysql
kubectl delete pvc/mysql-pv-claim
kubectl delete pv/mysql-pv-volume
echo "\n"

echo "${Cyan}------------------------------ Wordpress ----------------------------------------${Color_Off}"
kubectl delete deployment/wordpress
kubectl delete services wordpress
echo "\n"

echo "${Cyan}-----------------------------Phpmyadmin ----------------------------------------${Color_Off}"
kubectl delete deployment/phpmyadmin
kubectl delete service/phpmyadmin
echo "\n"
echo "${Cyan}-------------------------- influxdb -----------------------------${Color_Off}"
kubectl delete deploy influxdb
kubectl delete service influxdb
kubectl delete persistentvolumeclaims influxdb-pv-claim
echo "\n"
echo "${Cyan}-------------------------- grafana -----------------------------${Color_Off}"
kubectl delete deploy grafana
kubectl delete service grafana
kubectl delete persistentvolumeclaims grafana-pv-claim
kubectl delete persistentvolume/garfana-pv-volume
echo "\n"