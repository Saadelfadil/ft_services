kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml
kubectl proxy
kubectl create serviceaccount dashboard -n default
kubectl create clusterrolebinding dashboard-admin -n default
kubectl get secret $(kubectl get serviceaccount dashboard -o jsonpath="{.secret[0].name}") -o jsonpath="{.data.token}" | base64 --decode