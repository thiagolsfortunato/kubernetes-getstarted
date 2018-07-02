# Usage and Resource Monitoring

Addons to monitoring your cluster and pods

Add Heapster+Grafana to monitoring Minikube

```/bin/bash
sudo minikube addons enable heapster
```

Get status from pod kube-system

```/bin/bash
sudo kubectl get pods --namespace=kube-system
```

Open Heapster

```/bin/bash
sudo minikube addons open heapster
```