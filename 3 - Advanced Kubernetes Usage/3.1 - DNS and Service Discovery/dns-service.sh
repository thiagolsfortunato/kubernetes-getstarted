#!/bin/bash

#create service and deployment worpress-mysql 
sudo kubectl create -f mysql-deployment.yaml

#create service and deployment worpress
sudo kubectl create -f worpress-deployment.yaml

#get url from minikube
sudo minikube service wordpress --url