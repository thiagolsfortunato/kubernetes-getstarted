#!/bin/bash

#create cpu-limited-tomcat namespace
sudo kubectl create namespace cpu-limited-tomcat

#assign resource quota to cpu-limited-tomcat
sudo kubectl create -f tomcat-cpu-limit/tomcat-cpu-limit.yaml --namespace=cpu-limited-tomcat

#get resource from cpu-limited-tomcat namespace
sudo kubectl get resourcequota --namespace=cpu-limited-tomcat

#apply resource quota to tomcat-deployment
sudo kubectl apply -f tomcat-cpu-limit/tomcat-deployment.yaml --namespace=cpu-limited-tomcat

#describe deployment
sudo kubectl describe deployment tomcat-deployment --namespace=cpu-limited-tomcat