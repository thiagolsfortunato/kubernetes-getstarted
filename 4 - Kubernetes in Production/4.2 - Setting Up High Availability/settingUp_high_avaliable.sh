#!/bin/bash

#create aws s3 bucket
aws s3api create-bucket --bucket bucket-k8s-us-east-2 --region us-east-2 --create-bucket-configuration LocationConstraint=us-east-2

#create environment
export KOPS_STATE_STORE=s3://bucket-k8s-us-east-2

#create kops cluster
    #3 differents master zones, 3 nodes
kops create cluster bucket-k8s.demo.k8s.local --zones us-east-2a,us-east-2b,us-east-2c --node-count 3 --master-zones us-east-2a,us-east-2b,us-east-2c --yes

#kops validate cluster
kops validate cluster

#get kops nodes
kubectl get nodes

#deploy worpress-mysql on cluster
kubectl apply -f mysql-deployment.yaml

#deploy worpress on cluster
kubectl apply -f wordpress-deployment.yaml

#get deployments on cluster
kubectl get deployment

#describe deployments
kubectl describe deployment wordpress

#decribe service
kubectl describe service wordpress

#delete kops cluster
kops delete cluster --name=bucket-k8s.demo.k8s.local --yes