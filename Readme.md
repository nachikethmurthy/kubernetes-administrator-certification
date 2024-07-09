# This is a Repo on Kubernetes Administrator Session


# Install Kubectl locally


# Running an App on Kubernetes

- List Nodes in K8s cluster

```
kubectl get nodes 
```
- Deploy the application defined in pod.yml
```

kubectl apply -f pod.yml
kubectl describe pod first-pod # get detailed info about running pod

kubectl apply -f svc-cloud.yml # Deploy the service 

kubectl get svc # Check external IP of the service

kubectl delete pod first-pod

kubectl delete svc cloud-lb

kubectl delete pods --all

kubectl apply -f deploy.yml

kubectl get deployment catgif

kubectl delete deployment catgif

kubectl delete svc cloud-lb

kubectl get pods -o wide

kubectl get pods -o yaml

kubectl describe pods first-pod

kubectl logs first-pod

kubectl logs firstpod --container first_container # incase of Multi container


kubectl exec first-pod -- ps
kubectl exec -it first-pod -- sh
apk add curl
curl localhost:5000
```

# init pod demo
```
kubectl apply -f initpod.yml

kubectl get pods --watch
```

# Short Names - updated

| Short name           | Full name                    |
| -------------------- | ---------------------------- |
|  csr                 |  certificatesigningrequests  |
|  cs                  |  componentstatuses           |
|  cm                  |  configmaps                  |
|  ds                  |  daemonsets                  |
|  deploy              |  deployments                 |
|  ep                  |  endpoints                   |
|  ev                  |  events                      |
|  hpa                 |  horizontalpodautoscalers    |
|  ing                 |  ingresses                   |
|  limits              |  limitranges                 |
|  ns                  |  namespaces                  |
|  no                  |  nodes                       |
|  pvc                 |  persistentvolumeclaims      |
|  pv                  |  persistentvolumes           |
|  po                  |  pods                        |
|  pdb                 |  poddisruptionbudgets        |
|  psp                 |  podsecuritypolicies         |
|  rs                  |  replicasets                 |
|  rc                  |  replicationcontrollers      |
|  quota               |  resourcequotas              |
|  sa                  |  serviceaccounts             |
|  svc                 |  services                    |
