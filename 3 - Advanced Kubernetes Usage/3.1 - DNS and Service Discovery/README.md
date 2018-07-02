# DNS and Service Discovery

DNS link container IP to name, this is usefull when independent containers needs to connection.
Kubenetes generate and control that.

Create service and deployment worpress-mysql

```/bin/bash
sudo kubectl create -f mysql-deployment.yaml
```

Create service and deployment worpress

```/bin/bash
sudo kubectl create -f worpress-deployment.yaml
```

Get url from minikube

```/bin/bash
sudo minikube service wordpress --url
```