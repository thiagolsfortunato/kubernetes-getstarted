# Labels e Selectors

Key:value pairs that are attached to objects, such as pods.

Get nodes

```/bin/bash
sudo kubectl get nodes
```

Set label

```/bin/bash
sudo kubectl label node minikube storageType=ssd
```

Describe node

```/bin/bash
sudo kubectl describe node minikube
```

Apply modification label on deployment-tomcat

```/bin/bash
sudo kubectl apply -f ./deployment.yaml
```