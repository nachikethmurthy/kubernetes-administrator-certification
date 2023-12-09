# Labs

The node named worker-0 on the cluster b8s is experiencing problems with leaking memory. You must take down the node for maintenance by first disabling the scheduling of new Pods to the node worker-0. Then, evict all Pods that are currently running on worker-0. Finally, once you’ve verified that no Pods are running on worker-0, enable scheduling once again.


```
kubectl apply -f https://raw.githubusercontent.com/nachikethmurthy/kubernetes-administrator-certification/main/2.Controllers/Deployments/deploy-ex1.yml

kubectl cordon budget-worker-2 #disable scheduling
kubectl get nodes
kubectl taint no budget-controller node-role.kubernetes.io/control-plane:NoSchedule-

kubectl drain budget-worker-2
kubectl uncordon budget-worker-2

```


https://killercoda.com

https://github.com/lerndevops/kubernetes/tree/master

# Recommended Books for learning
- https://www.manning.com/books/acing-the-certified-kubernetes-administrator-exam
- https://www.amazon.in/Kubernetes-Book-2023-Grayscale-Indian/dp/9355423853/ref=sr_1_1?crid=CAYBMHGKYRPM&keywords=kubernetes+book&qid=1702099563&sprefix=kubernetes+boo%2Caps%2C203&sr=8-1