# Control Plane

PUBLICHOST=$(curl https://ipinfo.io/ip)

sudo kubeadm config images pull

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --control-plane-endpoint=$PUBLICHOST  

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml

curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/custom-resources.yaml -O

sed -i 's/cidr: 10\.10\.0\.0\/16/cidr: 192.168.0.0\/16/g' custom-resources.yaml
kubectl create -f custom-resources.yaml

export KUBECONFIG=/etc/kubernetes/admin.conf



kubeadm token create --print-join-command
# Reset

kubeadm reset -f && rm -rf /etc/kubernetes/









# Ignore

sudo kubeadm init --apiserver-advertise-address=$PUBLICHOST --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=NumCPU --ignore-preflight-errors=Mem

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=0.0.0.0 --apiserver-cert-extra-sans=$host[$PUBLICHOST] --ignore-preflight-errors=NumCPU --ignore-preflight-errors=Mem

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --control-plane-endpoint=$PUBLICHOST  



--upload-certs --apiserver-advertise-address=publicIP


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config



