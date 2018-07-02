#! /bin/bash

#Start minikube
sudo minikube start

#run kubectl
sudo kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080

#expose service to word
sudo kubectl expose deployment hello-minikube --type=NodePort

#get pods
sudo kubectl get pod

sleep 30

#get pods
sudo kubectl get pod

#get informations from service
curl $(sudo minikube service hello-minikube --url)

sleep 60

#delete pod
sudo kubectl delete deployment hello-minikube 

#stop minikube
sudo minikube stop