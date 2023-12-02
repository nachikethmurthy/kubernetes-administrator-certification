# Certificates Folder
```
sudo ls /etc/kubernetes
sudo cat /etc/kubernetes/ kubelet.conf
sudo ls /etc/kubernetes/pki
 ```

 # Kubeconfig file

 ```
 cd ~
 cd .kube
 vi config
 ```

 ```
mkdir -p /home/dev-user/certs
cd /home/dev-user/certs
sudo openssl genrsa -out dev-user.key 2048
 
sudo openssl req -new -key dev-user.key -out dev-user.csr -subj "/CN=dev-user/O=devops"
ls -l
sudo cat dev-user.csr | base64 | tr -d '\n'
kubectl get csr

kubectl certificate approve prodcsr
kubectl get csr dev-user -o jsonpath="{.status.certificate}" | base64 --decode > dev-user.crt      ## this generates a crt file
 
kubectl create role prodadmin --verb=get,list,watch,create --resource=pods,services --namespace default
kubectl get roles
kubectl describe role prodadmin
   
kubectl create rolebinding prodadminbinding --user=dev-user --role=prodadmin --namespace default
kubectl get pods --as dev-user
kubectl get deploy  --as dev-user
kubectl -n kube-system get pods --as dev-user
kubectl delete role prodadmin
kubectl delete rolebinding prodadminbinding
kubectl get clusterroles
kubectl describe clusterrole admin
   45  kubectl create clusterrolebinding abcd --user=dev-user --clusterrole view
   46  kubectl get all --all-namespaces --as dev-user
   47  kubectl run pod1 --image nginx -n kube-system --as dev-user
   48  kubectl run pod1 --image nginx --as dev-user
   49  
   50  kubectl config get-contexts
   51  cd
   52  vi .kube/config
==== create a dummy context=====
   53  kubectl config get-contexts
   54  
   55*
   56  vi .kube/config
   57  kubectl config use-context testcluster
   58  kubectl config get-contexts
   59  kubectl get pods
   60  kubectl config use-context kubernetes-admin@kubernetes
  



#### To SEE Users : kubectl config view -o jsonpath='{.users[].name}' ;echo ""










 
 ```

