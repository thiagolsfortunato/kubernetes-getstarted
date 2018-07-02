#!/bin/bash

#Deploy Mongo container and Scale 4 replicas

#Solution 1
    #deploy mongo-deployment
    sudo kubectl run mongo-deployment --image=mongo --port=27017

    #scale 4
    sudo kubectl scale replicas=4 deployment/mongo-deployment

    #describe mongo-deployment
    sudo kubectl describe deployment mongo-deployment

#Solution 2
    #deploy using mongo-deployment.yaml
    sudo kubectl apply -f mongo-deployment.yaml

    #deploy service
    sudo kubectl apply -f mongo-service.yaml

    #get service
    sudo kubectl get service

    #expose service
    sudo minikube service mongodb-service