#!/bin/bash

#create environment
export KOPS_STATE_STORE=s3://bucket-k8s-us-east-2

#create kops cluster
kops create cluster bucket-k8s.demo.k8s.local --zones us-east-2a --yes

#kops validate cluster
kops validate cluster

#deploy worpress-mysql on cluster
kubectl apply -f mysql-deployment.yaml

#deploy worpress on cluster
kubectl apply -f wordpress-deployment.yaml

#describe persistentvolumes
kubectl describe persistentvolumes

#describe kubectl service wordpress
kubectl describe service wordpress

#delete kops cluster
kops delete cluster --name=bucket-k8s.demo.k8s.local --yes