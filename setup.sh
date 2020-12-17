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

echo -e "${Purple}-------------------------- Metalllb && minikube ------------------------------${Color_Off}"
minikube start --vm-driver virtualbox --memory 3000 --addons metrics-server --extra-config=apiserver.service-node-port-range=80-65000
eval $(minikube docker-env)

sed -i '' s/MINIKUBE_IP/$(minikube ip)/g srcs/metallb.yaml
sed -i '' s/MINIKUBE_IP/$(minikube ip)/g srcs/nginx/nginx.conf
sed -i '' s/MINIKUBE_IP/$(minikube ip)/g srcs/ftps/ftps.sh
sed -i '' s/MINIKUBE_IP/$(minikube ip)/g srcs/mysql/wordpress.sql

minikube addons enable metallb
kubectl apply -f srcs/metallb.yaml
echo -e "\n"


echo -e "${Green}----------------------------- Nginx ------------------------------${Color_Off}"
docker build --tag nginx srcs/nginx
kubectl create -f srcs/nginx/nginx.yaml
echo -e "\n"


echo -e "${Cyan}--------------------------- Mysql --------------------------------${Color_Off}"
docker build --tag mysql srcs/mysql
kubectl create -f srcs/mysql/mysql.yaml
echo -e "\n"


echo -e "${Blue}------------------------- Phpmyadmin -----------------------------${Color_Off}"
docker build -t phpmyadmin srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml
echo -e "\n"


echo -e "${Yellow}-------------------------- Wordpress -----------------------------${Color_Off}"
docker build --tag wordpress srcs/wordpress
kubectl create -f srcs/wordpress/wordpress.yaml
echo -e "\n"


echo -e "${Red}-------------------------- influxdb -----------------------------${Color_Off}"
docker build --tag influxDB srcs/influxDB
kubectl create -f srcs/influxDB/influxdb.yaml
echo -e "\n"


echo -e "${White}-------------------------- grafana -----------------------------${Color_Off}"
docker build --tag grafana srcs/grafana
kubectl create -f srcs/grafana/grafana.yaml
echo -e "\n"

echo -e "${White}-------------------------- ftps -----------------------------${Color_Off}"
docker build --tag ftps srcs/ftps
kubectl create -f srcs/ftps/ftps.yaml
echo -e "\n"

minikube dashboard