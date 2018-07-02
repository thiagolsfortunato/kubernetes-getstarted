#!/bin/bash

#stop minikube
sudo minikube stop

#define audit policy
cat audit-policy.yaml

#copy audit policy to minikube's host folder
sudo cp audit-policy.yaml ~/.minikube/addons

#define start minikube
cat minikubeStartWithAudit.sh

#connect to minikune
sudo minikube ssh

#read log
$ cat /var/logs/audit.log

#read json format
$ cat /var/logs/audit.log | jq .

#loggout minikube
$ exit