sudo apt install etcd-client
sudo su -
export ETCDCTL_API=3
etcdctl -v


etcdctl snapshot save snapshotdb --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/server.crt --key /etc/kubernetes/pki/etcd/server.key


ls | grep snapshotdb

etcdctl snapshot status snapshotdb --write-out=table

export KUBECONFIG=/etc/kubernetes/admin.conf


etcdctl snapshot restore snapshotdb --data-dir /var/lib/etcd-restorev2

# All Kuberenetes Resources manifest available at 
`/etc/kubernetes/manifests`