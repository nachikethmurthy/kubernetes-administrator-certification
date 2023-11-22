# Pod to Pod Networking

```
kubectl apply -f https://raw.githubusercontent.com/nachikethmurthy/kubernetes-administrator-certification/main/Kubernetes-101/deploy.yml

kubectl apply -f https://raw.githubusercontent.com/nachikethmurthy/kubernetes-administrator-certification/main/Kubernetes-101/svc-local.yml


```

kubectl patch service cloud-lb \
-n cloud-lb \
-p '{"spec": {"type": "LoadBalancer", "externalIPs":["34.29.118.15"]}}'