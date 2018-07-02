# Your First k8s App

## Links

### [Kubectl reference](https://kubernetes.io/docs/user-guide/kubectl)

### [Cheat sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

Create "tomcat-deployment"

```/bin/bash
sudo kubectl apply -f ./deployment.yaml
```

Export port "tomcat-deployment" to the world

```/bin/bash
sudo kubectl expose deployment tomcat-deployment --type=NodePort
```

Get URL "tomcat-deployment"

```/bin/bash
sudo minikube service tomcat-deployment --url
```

List informations all pods

```/bin/bash
sudo kubectl get pods
```

List all pods were deployed

```/bin/bash
sudo kubectl get deployments --all-namespaces
```

Delete pods deployed

```/bin/bash
sudo kubectl delete deployments tomcat-deployment
```

List informations about especific pod

```/bin/bash
sudo kubectl describe pod tomcat-deployment
```

Forward port 5000 to 6000 

```/bin/bash
sudo kubectl port-forward tomcat-deployment 5000:6000
```

Attach command the container

```/bin/bash
sudo kubectl attach tomcat-deployment
```

Enter inside on the container

```/bin/bash
sudo kubectl exec -it tomcat-deployment bash
```

Setting labels on pod

```/bin/bash
sudo kubectl label pods tomcat-deployment healthy=false
```

Run particular image on the cluster

```/bin/bash
sudo kubectl run [name-container] --image=[name-image] --port=[container-port]
```

Scale pod

```/bin/bash
sudo kubectl scale --replicas=[4] deployments/tomcat-deployment
```

Define load-balancer service

```/bin/bash
sudo kubectl expose deployments tomcat-deployment --type=LoadBalancer --port=8080 --target-port=8080 --name tomcat-load-balancer
```

Get URL "tomcat-load-balancer"

```/bin/bash
sudo kubectl describe services tomcat-load-balancer
```