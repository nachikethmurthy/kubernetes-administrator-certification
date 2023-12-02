# Labs

```
kubectl config get-contexts
kubectl config get-clusters
kubectl config get-users


kubectl api-resources --sort-by name -o wide | grep deploy

kubectl describe pod/kube-api-server

kubectl get clusterolebindings
```

sudo kubectl config --kubeconfig=user1.conf set-cluster production --server=https://10.240.0.31:6443 --certificate-authority=/etc/kubernetes/pki/ca.crt


```
kubectl create role pod-deploy-reader --verb=get --verb=list --verb=watch --resource=pods,deployments --dry-run=client -o yaml


kubectl create role pod-deploy-reader --verb=get --verb=list --verb=watch --resource=pods,deployments
 
kubectl create rolebinding pod-deploy-reader-binding --role=pod-deploy-reader --serviceaccount=default:default --dry-run=client -o yaml

kubectl create rolebinding pod-deploy-reader-binding --role=pod-deploy-reader --serviceaccount=default:default 
 
TOKEN=$(kubectl get secret -n default -o json | jq -r '(.items[].data.token)' | base64 --decode | tr -d "\n")
 
curl -X GET https://10.240.0.31:6443/api/v1/namespaces/default/pods --header "Authorization: Bearer $TOKEN" --cacert /etc/kubernetes/pki/ca.crt
 
curl -X GET https://10.240.0.31:6443/apis/apps/v1/namespaces/default/deployments --header "Authorization: Bearer $TOKEN" --cacert /etc/kubernetes/pki/ca.crt

```