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
mkdir -p /home/prod-user/certs
cd /home/prod-user/certs
sudo openssl genrsa -out prod-user.key 2048
 
sudo openssl req -new -key prod-user.key -out prod-user.csr -subj "/CN=prod-user/O=devops"
ls -l
sudo cat prod-user.csr | base64 | tr -d '\n'
kubectl get csr

kubectl certificate approve user1
kubectl get nodes --as prod-user
kubectl get csr user1 -o jsonpath="{.status.certificate}" | base64 --decode > prod-user.crt      ## this generates a crt file
kubectl apply -f CertificateSigningRequest.yml
kubectl get no --as prod-user  # Authorization not provided

# Authorization
kubectl create role prodadmin --verb=get,list,watch,create --resource=pods,services --namespace default --dry-run=client -o yaml

kubectl apply -f role.yml

kubectl get roles
kubectl describe role prodadmin   

kubectl create rolebinding prodadminbinding --user=prod-user --role=prodadmin --namespace default --dry-run=client -o yaml

kubectl apply rolebinding.yml

kubectl get pods --as prod-user
kubectl get deploy  --as prod-user
kubectl -n kube-system get pods --as prod-user
kubectl delete role prodadmin
kubectl delete rolebinding prodadminbinding

kubectl get clusterroles
kubectl describe clusterrole admin

kubectl describe clusterrole view

kubectl create clusterrolebinding abcd --user=prod-user --clusterrole view --dry-run=client -o yaml

kubectl apply -f cluster-role-binding.yml

kubectl get all --all-namespaces --as prod-user
kubectl run pod1 --image nginx -n kube-system --as prod-user

kubectl run pod1 --image nginx --as prod-user

kubectl config get-contexts
cd
vi .kube/config

cat prod-user.crt | base64 -w0 


kubectl config use-context docker-desktop


# Create a new server
  gcloud compute instances create budget-worker-4 \
  --async \
  --boot-disk-size 200GB \
  --can-ip-forward \
  --image-family ubuntu-2204-lts \
  --image-project ubuntu-os-cloud \
  --machine-type e2-small \
  --private-network-ip 10.240.0.4${i} \
  --scopes compute-rw,storage-ro,service-management,service-control,logging-write,monitoring \
  --subnet k8s-nodes \
  --zone us-central1-f \
  --tags example-k8s,worker

# Install Kubectl on new node

sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl
sudo mkdir /etc/apt/keyrings
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

kubectl get pods -A

kubectl get pods -n kube-system
 

==== create a dummy context=====
kubectl config get-contexts
vi .kube/config
kubectl config use-context testcluster
kubectl config get-contexts
kubectl get pods
kubectl config use-context kubernetes-admin@kubernetes
  
# Service accoint
 kubectl get sa
 kubectl describe sa default


#### To SEE Users : kubectl config view -o jsonpath='{.users[].name}' ;echo ""










 
 ```

