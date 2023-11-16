# Commands for Hands On
```
alias k=kubectl
k get no --show-labels # display default labels associated with the nodes
k label no workernode-1 favorite=node
k get no --show-labels
k apply -f https://raw.githubusercontent.com/nachikethmurthy/kubernetes-administrator-certification/main/scheduler/pod.yml
```