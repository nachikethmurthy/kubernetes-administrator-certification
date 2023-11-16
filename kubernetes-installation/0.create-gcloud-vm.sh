#!/bin/bash
gcloud compute networks create example-k8s --subnet-mode custom

gcloud compute networks subnets create k8s-nodes \
--network example-k8s \
--range 10.240.0.0/24

gcloud compute firewall-rules create example-k8s-allow-internal \
--allow tcp,udp,icmp,ipip \
--network example-k8s \
--source-ranges 10.240.0.0/24

gcloud compute firewall-rules create example-k8s-allow-external \
--allow tcp:22,tcp:6443,icmp \
--network example-k8s \
--source-ranges 0.0.0.0/0

gcloud compute instances create controller \
  --async \
  --boot-disk-size 200GB \
  --can-ip-forward \
  --image-family ubuntu-2204-lts \
  --image-project ubuntu-os-cloud \
  --machine-type n1-standard-2 \
  --private-network-ip 10.240.0.11 \
  --scopes compute-rw,storage-ro,service-management,service-control,logging-write,monitoring \
  --subnet k8s-nodes \
  --zone us-central1-f \
  --tags example-k8s,controller    

for i in 0 1 2; do
  gcloud compute instances create worker-${i} \
  --async \
  --boot-disk-size 200GB \
  --can-ip-forward \
  --image-family ubuntu-2204-lts \
  --image-project ubuntu-os-cloud \
  --machine-type n1-standard-2 \
  --private-network-ip 10.240.0.2${i} \
  --scopes compute-rw,storage-ro,service-management,service-control,logging-write,monitoring \
  --subnet k8s-nodes \
  --zone us-central1-f \
  --tags example-k8s,worker
done