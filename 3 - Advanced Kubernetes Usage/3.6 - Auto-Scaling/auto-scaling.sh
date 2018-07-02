#!/bin/bash

#Horizontal Pod Autosacaler (HPA) facility that adjusts the number of replica of a Pod to match observe average CPU utilization
#HPA will create or delete a Pod based average CPU;

#deployment Pod
sudo kubectl apply -f wordpress-deployment.yaml

#create HPA
sudo kubectl autoscale deployment wordpress --cpu-percent=50 --min=1 --max=10

#get describe from deployment
sudo kubectl describe deployment wordpress

#create Pod busybox to simulate load using infite HTTP request to wordpress to spike CPU and see how HPA responds
sudo kubectl run -it load-generator --image=busybox /bin/sh

#run this command inside the Pod busybox
$ while true; do wget -q -O- http://wordpress.default.svc.cluster.local; done

#open another instance of the terminal and check HPA 
sudo kubectl get hpa