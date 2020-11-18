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

minikube start --vm-driver virtualbox --memory 3000 --addons metrics-server --extra-config=apiserver.service-node-port-range=80-65000
eval $(minikube docker-env)

echo "${Purple}-------------------------- Metalllb ------------------------------${Color_Off}"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl create -f srcs/metallb.yaml
echo "\n"

echo "${Green}----------------------------- Nginx ------------------------------${Color_Off}"
docker build --tag nginx srcs/nginx
kubectl create -f srcs/nginx/nginx.yaml
echo "\n"

echo "${Cyan}--------------------------- Mysql --------------------------------${Color_Off}"
docker build --tag wp srcs/wordpress
kubectl create -f srcs/wordpress/wordpress.yaml
echo "\n"

echo "${Blue}------------------------- Phpmyadmin -----------------------------${Color_Off}"
docker build --tag mysql srcs/mysql 
kubectl create -f srcs/mysql/mysql.yaml
echo "\n"

echo "${Yellow}-------------------------- Wordpress -----------------------------${Color_Off}"
docker build -t pma srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml
echo "\n"