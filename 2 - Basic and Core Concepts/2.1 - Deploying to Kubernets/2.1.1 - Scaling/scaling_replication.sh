#!/bin/bash

#scale deployment
sudo kubectl scale --replicas=4 deployment/tomcat-deployment

#get all deployments
sudo kubectl get deployments

#expose load balancer
sudo kubectl expose deployment tomcat-deployment --type=LoadBalancer --port=8080 --target-port=8080 --name=tomcat-load-balancer

#get IP address was assigned for the service
sudo kubectl describe services tomcat-load-balancer