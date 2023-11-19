```kubectl api-resources
kubectl get namespaces 
kubectl describe namespace default #  kubectl describe ns default
kubectl get svc --namespace kube-system
kubectl get svc --all-namespaces
kubectl get svc -A
kubectl create ns akatsuki
kubectl delete ns naruto-ns

kubectl config set-context --current --namespace akatsuki

kubectl get pods --all-namespaces

kubectl get pods -n akatsuki
kubectl get svc -n akatsuki

kubectl delete ns akatsuki

kubectl config set-context --current --namespace default

```