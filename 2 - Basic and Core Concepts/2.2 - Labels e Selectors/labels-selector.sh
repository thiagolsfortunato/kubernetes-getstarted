#!/bin/bash

#get nodes
sudo kubectl get nodes

#set label
sudo kubectl label node minikube storageType=ssd

#describe node
sudo kubectl describe node minikube

#configuring modification label on deployment-tomcat
sudo kubectl apply -f ./deployment.yaml 