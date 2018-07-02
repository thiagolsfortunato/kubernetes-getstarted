#!/bin/bash

#Key k8s architecture items (Componentes High Availability)
    #master
        #kube-apiserver: run all master node ()
        #kube-controller-manager
        #kube-scheduler
    #etcd: should be run all master node (store key:value pairs that is data in a k8s cluster)

#install kops
#kops: kops helps you create, destroy, upgrade and maintain production-grade, highly available, Kubernetes clusters from the command line.
#AWS (Amazon Web Services) is currently officially supported, with GCE in beta support , and VMware vSphere in alpha, and other platforms planned.
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl-s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
sudo chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

#install CLI aws
#https://docs.aws.amazon.com/cli/latest/userguide/awscli-install-linux.html
pip install awscli --upgrade --user

#check version
aws --version

#upgrade lastest version aws cli
pip install awscli --upgrade --user

#configure your aws cli (AWS > IAM > Access Key)
aws configure

#create aws s3 bucket
aws s3api create-bucket --bucket bucket-k8s-us-east-2 --region us-east-2 --create-bucket-configuration LocationConstraint=us-east-2

#create environment
export KOPS_STATE_STORE=s3://bucket-k8s-us-east-2

#create kops cluster
kops create cluster bucket-k8s.demo.k8s.local --zones us-east-2a --yes

#kops validate cluster
kops validate cluster

#get kops nodes
kubectl get nodes --show-labels

#ssh to master >  FAIL!!
ssh -i ~/.ssh/id_rsa admin@api.bucket-k8s.demo.k8s.local

#get master public DNS from AWS console and retry
ssh -i ~/.ssh/id_rsa admin@ec2-18-222-109-125.us-east-2.compute.amazonaws.com

#log from kube-apiserver
cat /var/log/kube-apiserver.log

#list docker containers
sudo docker container ls

#get deployments from namespace kube-system
kubectl get deployments --namespace=kube-system

#delete kops cluster
kops delete cluster --name=bucket-k8s.demo.k8s.local --yes