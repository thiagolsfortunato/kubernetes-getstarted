#!/bin/bash

#add Heapster to monitoring Minikube
sudo minikube addons enable heapster

#get status from pod kube-system
sudo kubectl get pods --namespace=kube-system

#open heapster
sudo minikube addons open heapster