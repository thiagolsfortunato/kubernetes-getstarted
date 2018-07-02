#!/bin/bash

#creta local persistent volumes
sudo kubectl apply -f local-volumes.yaml

#get persistent volumes
sudo kubectl get persistentvolumes

#apply persistent volumes to mysql-deployment
sudo kubectl apply -f mysql-deployment.yaml

#apply persistent volumes to wordpress-deployment
sudo kubectl apply -f wordpress-deployment.yaml

#stop minikube and start
sudo minikube stop && sudo minikube start

#delete deployment
sudo kubectl delete deployment wordpress

#apply wordpress-deployment
sudo kubectl apply -f wordpress-deployment.yaml

#get url minikube
sudo minikube service wordpress --url