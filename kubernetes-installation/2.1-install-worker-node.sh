#!/bin/bash
sudo su -
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker.service
sudo apt install -y apt-transport-https curl

curl -fsSL https://dl.k8s.io/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

echo "installation done, execute join with - kubeadm token create --print-join-command if its worker node, else proceed with other steps on Control node "