# Lab for Network Concepts - DNS

```
alias k="kubectl" # set alias
kubectl -n kube-system get svc # get services
ping budget-worker-0 # Automatically ip address will be resolved
kubectl -n kube-system get po
kubectl -n kube-system get deploy
kubectl get pods -n kube-system # 2 pods will be running
kubectl -n kube-system scale deploy coredns --replicas 3
kubectl get pods -n kube-system

# Create deployment and service
kubectl create deploy apache --image httpd; k expose deploy apache --name apache-svc --port 80

kubectl run netshoot --image=nicolaka/netshoot --command sleep --command "3600"
kubectl exec -it netshoot -- bash

kubectl create ns my-namespace
kubectl get ns

kubectl delete all --all
kubectl get all

kubectl -n my-namespace create deploy nginx --image nginx; kubectl -n my-namespace expose deploy nginx --name nginx-svc --port 80

kubectl get pods -n my-namespace
kubectl exec -it nginx-7854ff8877-55j7d -n my-namespace -- bash

curl apache-svc # cannot be reached

curl apache-svc.default 
```
![Alt text](image.png)