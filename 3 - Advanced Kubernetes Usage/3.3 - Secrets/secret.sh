#!/bin/bash

#create secret password using literal parameters
sudo kubectl create secret generic mysql-pass --from-literal=password=ROOT_PASSWORD

#create secret using file.txt
sudo kubectl create secret generic db-user-pass --from-file=secrets_file/user.txt --from-file=secrets_file/password.txt

#apply modifications on deployments
sudo kubectl apply -f mysql-deployment.yaml 
sudo kubectl apply -f wordpress-deployment.yaml 

#connect to wordpress
sudo minikube service wordpress --url