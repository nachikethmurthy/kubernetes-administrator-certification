## ConfigMpas

> Many applications rely on configuration which is used during either application initialization or runtime. 

> Most of the times there is a requirement to adjust values assigned to configuration parameters. 

> `ConfigMaps is the kubernetes way to inject application pods with configuration data`. 

> ConfigMaps allow you to decouple configuration artifacts from image content to keep containerized applications portable. 

#### `A ConfigMap is an API object` used to store non-confidential data in key-value pairs in the cluster store (ETCD). 

#### `Pods can consume ConfigMaps` as 

* environment variables, 
* command-line arguments, 
* or as configuration files in a volume.

### [MORE INFO](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)

# Commands for Hands On
```
kubectl create configmap redis-config --from-literal=key1=config1 --from-literal=key2=config2 --dry-run=client -o yaml > redis-config.yaml

kubectl apply -f multimap.yml
kubectl get cm
kubectl describe cm multimap
kubectl apply -f envpod.yml

kubectl exec -it envpod -- sh 
printenv

kubectl apply -f config-map-ex2.yml
kubectl exec -it cm-env-var-pod -- bash
printenv

kubectl apply -f startup-pod.yml
kubectl logs startup-pod
kubectl get po

kubectl apply -f cmpod.yml
kubectl exec -it cmvol -- bash
cd /etc/name
cat given
cat family
exit

kubectl apply -f config-map-ex1.yml


kubectl create cm testmap2 --from-file cmfile.txt  # create from file

kubectl create configmap nginx-html --from-file=index.html
kubectl create configmap nginx-env --from-env-file=db.props

kubectl create configmap game-config-env-file \
       --from-env-file=configure-pod-container/configmap/game-env-file.properties```

## create configmap from leteral values
	kubectl create configmap special-config --from-literal=special.how=very --from-literal=special.type=charm
	
## create configmap using multiple files
	kubectl create configmap my-cofigmap-2 --from-file=/path/to/dir/db.prop --from-file=/path/to/dir/ui.properties
	
# Create the local directory
	mkdir -p /app/configmap
	touch db.props ui.props
	kubectl create configmap my-app-config --from-file=/app/configmap/