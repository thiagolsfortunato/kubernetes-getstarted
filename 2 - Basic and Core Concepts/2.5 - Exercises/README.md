# Exercises

## Deploy Mongo container and Scale 4 replicas

### Solution 1

Deploy mongo-deployment

```/bin/bash
sudo kubectl run mongo-deployment --image=mongo --port=27017
```

Scale 4

```/bin/bash
sudo kubectl scale replicas=4 deployment/mongo-deployment
```

Describe mongo-deployment

```/bin/bash
sudo kubectl describe deployment mongo-deployment
```

### Solution 2

Deploy using mongo-deployment.yaml

```/bin/bash
sudo kubectl apply -f mongo-deployment.yaml
```

Deploy service

```bin/bash
sudo kubectl apply -f mongo-service.yaml
```

Get service

```/bin/bash
sudo kubectl get service
```

Expose service

```/bin/bash
sudo minikube service mongodb-service
```