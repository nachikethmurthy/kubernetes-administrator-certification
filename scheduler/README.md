# Commands for Hands On
```
alias k=kubectl
k get no --show-labels # display default labels associated with the nodes
k label no workernode-1 favorite=wk-node
k get no --show-labels
k describe node workernode-1
k apply -f https://raw.githubusercontent.com/nachikethmurthy/kubernetes-administrator-certification/main/scheduler/pod.yml
```