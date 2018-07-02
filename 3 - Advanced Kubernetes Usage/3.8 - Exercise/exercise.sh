#!/bin/bash

#create PersistemVolume
sudo kubectl create -f local-volume.yaml

#create ghost service 
sudo kubectl create -f ghost-deployment.yaml

#create auto-scaling
sudo kubectl autoscale deployment ghost --cpu-percent=50 --min=1 --max=10

#create Pod busybox to simulate load using infite HTTP request to wordpress to spike CPU and see how HPA responds
sudo kubectl run -it load-generator --image=busybox /bin/sh

#run this command inside the Pod busybox
$ while true; do wget -q -O- http://ghost.default.svc.cluster.local; done

#open another instance of the terminal and check HPA 
sudo kubectl get hpa