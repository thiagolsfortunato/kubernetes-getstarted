#!/bin/bash

#get deployments
sudo kubectl get deployment

#get status deployments
sudo kubectl rollout status deployment tomcat-deployment

#upadate image from deployment
sudo kubectl set image deployment/tomcat-deployment tomcat=tomcat:9.0.1

#history of rollout of a deployment
sudo kubectl rollout history deployment/tomcat-deployment

#revision history of rollout of a deployment
sudo kubectl rollout history deployment/tomcat-deployment --revision=2