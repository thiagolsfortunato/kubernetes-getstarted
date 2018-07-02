# Namespace and Resource Quotas

## Namespace

Namespaces create multiple virtual clusters on the same physical clusters, called namespaces.

## Quotas

Quotas in namespaces limitis: compute, storage, memory and how many objects can exist.

Create cpu-limited-tomcat namespace

```/bin/bash
sudo kubectl create namespace cpu-limited-tomcat
```

Assign resource quota to cpu-limited-tomcat

```/bin/bash
sudo kubectl create -f tomcat-cpu-limit/tomcat-cpu-limit.yaml --namespace=cpu-limited-tomcat
```

Get resource from cpu-limited-tomcat namespace

```/bin/bash
sudo kubectl get resourcequota --namespace=cpu-limited-tomcat
```

Apply resource quota to tomcat-deployment

```/bin/bash
sudo kubectl apply -f tomcat-cpu-limit/tomcat-deployment.yaml --namespace=cpu-limited-tomcat
```

Describe deployment

```/bin/bash
sudo kubectl describe deployment tomcat-deployment --namespace=cpu-limited-tomcat
```