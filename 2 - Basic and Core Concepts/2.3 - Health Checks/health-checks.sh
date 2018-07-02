#!/bin/bash

#readiness probes: to determine when Pod is READY, after started the container
#liveness probes: to determine when Pod is "HEALTHY" or "UNHEALTHY", after is become READY

#add healthy check 
sudo kubectl apply -f ./deployment.yaml 

#describe deployment tomcat-deployment
sudo kubectl describe deployment tomcat-deployment