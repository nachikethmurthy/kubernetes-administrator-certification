## Replication Controller 

> A ReplicationController ensures that a specified number of pod replicas are running at any one time. In other words, a ReplicationController makes sure that a pod or a homogeneous set of pods is always up and available.


### Lab

```
create a manifest file with Kind ReplicationController & use kubectl to create the object in k8s API Server.

kubectl create -f rc-example1.yml                # create replication Controller
kubectl apply -f rc-example2.yml                 # udpate the replication Controller

kubectl get rc                              # List all replication Controllers in current active namespace
kubectl get rc -n <namespace>               # List the replication controllers in <namespace>
kubectl get rc --show-labels                # list the labels for rc
kubectl get rc -l rc=myapprc -o wide        # list replication controllers with matching labels
kubectl get pods | grep tomcatrc            # list the pods associated with rc
kubectl get rc tomcatrc -o yaml             # detailed object config
 
kubectl describe rc <rcname>                # inspect the replication controller
kubectl label rc <rcname> key=value         # label the replication controller
kubectl label rc <rcname> key-         # remove the label
kubectl scale --replicas=x rc <rcname>      # Scale replication controller
kubectl expose rc <rcname> --port=<external> --target-port=<internal> # expose rc as service & assign port on the cluster
kubectl expose rc <rcname> --port=<external> --type=NodePort # expose rc as service & assign port on the Node
kubectl delete rc <rcname>                  # delete rc & pod under it
```

# Additional Exercises for Practice - labels & selectors

```
# Create some pods
kubectl run my-pod0 --image=nginx -l tier=front-end
kubectl run my-pod1 --image=nginx:1.23.4 -l tier=front-end,env=dev
kubectl run my-pod2 --image=nginx:stable -l tier=back-end,env=test
kubectl run my-pod3 --image=nginx:alpine -l tier=back-end,env=prod
```

Returning the pods with labels

```
kubectl get pods --show-labels
kubectl get pods -l tier!=back-end # not equal to back-end
kubectl get pods --selector tier=back-end,env=test # Selector
```

Set-Based Selector
- It may specify multiple values with a single key and any one of the key-values should match to select that object.

- If multiple selectors are in the manifest file, all the selectors have to match to select the object (like, AND operator).

```
kubectl get pods -l 'env in (dev,prod)'
kubectl get pods --selector 'tier notin (front-end)'
kubectl get pods -l 'env' #To select an object with label key (exist)


```

