minikube delete
minikube start --extra-config=apiserver.service-node-port-range=1-30000
eval $(minikube docker-env)
docker build -t nginx_docker .
kubectl create -f deployment_nginx.yaml
kubectl create -f service.yaml
kubectl create -f nginx_controller.yaml
minikube addons enable ingress
