# Web Interface

## Dashboard UI

- run only Kubernetes Master
- provides a variety of views Kubernetes cluster
- update, delete and creation of anything in yout kubernetes cluster
- access the same API as kubectl

Installing dashboad

```/bin/bash
sudo kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
```

Set proxy

```/bin/bash
sudo kubectl proxy
```

[Dashboard UI](http://localhost:8001/api/v1/namespaces/kube-system/services/kubernetes-dashboard/proxy/#!/overview?namespace=default)