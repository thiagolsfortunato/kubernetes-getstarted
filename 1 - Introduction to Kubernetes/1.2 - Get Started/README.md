# Get Started

Start minikube

```/bin/bash
sudo minikube start
```

Run kubectl

```/bin/bash
sudo kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
```

Expose service to word

```/bin/bash
sudo kubectl expose deployment hello-minikube --type=NodePort
```

List pods

```/bin/bash
sudo kubectl get pod
```

Get informations from service

```/bin/bash
curl $(sudo minikube service hello-minikube --url)
```

Delete pod

```/bin/bash
sudo kubectl delete deployment hello-minikube 
```

Stop minikube

```/bin/bash
sudo minikube stop
```