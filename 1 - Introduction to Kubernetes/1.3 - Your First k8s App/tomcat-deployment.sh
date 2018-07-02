#! /bin/bash

##kubectl reference
##https://kubernetes.io/docs/user-guide/kubectl

##cheat sheet
##https://kubernetes.io/docs/reference/kubectl/cheatsheet/

#create "tomcat-deployment" 
sudo kubectl apply -f ./deployment.yaml 

#export port "tomcat-deployment" to the world
sudo kubectl expose deployment tomcat-deployment --type=NodePort

#get URL "tomcat-deployment"
sudo minikube service tomcat-deployment --url

#list informations all pods 
sudo kubectl get pods

#list all pods were deployed
sudo kubectl get deployments --all-namespaces

#delete pods deployed
sudo kubectl delete deployments tomcat-deployment

#list informations about especific pod
sudo kubectl describe pod tomcat-deployment

#forward port 5000 to 6000 
sudo kubectl port-forward tomcat-deployment 5000:6000

#attach command the container
sudo kubectl attach tomcat-deployment

#enter inside the container
sudo kubectl exec -it tomcat-deployment bash

#setting labels on pod
sudo kubectl label pods tomcat-deployment healthy=false

#run particular image on the cluster
sudo kubectl run [name-container] --image=[name-image] --port=[container-port]

#scale pod
sudo kubectl scale --replicas=[4] deployments/tomcat-deployment

#define load-balancer service
sudo kubectl expose deployments tomcat-deployment --type=LoadBalancer --port=8080 --target-port=8080 --name tomcat-load-balancer

#get URL "tomcat-load-balancer"
sudo kubectl describe services tomcat-load-balancer