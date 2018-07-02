# Volumes

Volume persiste local store critical data.

Crete local persistent volumes

```/bin/bash
sudo kubectl apply -f local-volumes.yaml
```

Get persistent volumes

```/bin/bash
sudo kubectl get persistentvolumes
```

Apply persistent volumes to mysql-deployment

```/bin/bash
sudo kubectl apply -f mysql-deployment.yaml
```

Apply persistent volumes to wordpress-deployment

```/bin/bash
sudo kubectl apply -f wordpress-deployment.yaml
```

Stop Minikube and start again to mount volume

```/bin/bash
sudo minikube stop && sudo minikube start
```

Delete deployment

```/bin/bash
sudo kubectl delete deployment wordpress
```

Apply wordpress-deployment

```/bin/bash
sudo kubectl apply -f wordpress-deployment.yaml
```

Get url minikube

```/bin/bash
sudo minikube service wordpress --url
```