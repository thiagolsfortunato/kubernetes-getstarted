# Scaling

Kubernets allow you to define replicas when you deploy an application

## Replicaset

Deploy replicas application when has free recurse, no control what pods.

## Daemonset

Ensure an deploy 1 replica in all pods, independently if has or haven't recurse.

Scale deployment

```/bin/bash
sudo kubectl scale --replicas=4 deployment/tomcat-deployment
```

Get all deployments

```/bin/bash
sudo kubectl get deployments
```

## LoadBalancer

Is a type of service that exposes a single port to world, but internal logic which we'll cover later to decide which replica to send the request to.

Expose load balancer

```/bin/bash
sudo kubectl expose deployment tomcat-deployment --type=LoadBalancer --port=8080 --target-port=8080 --name=tomcat-load-balancer
```

## Service

Is high level that architeture kubernete, your objective is expose a single port to word of the scaled deployments

### service > deployment > pod > container

Get IP address was assigned for the service

```/bin/bash
sudo kubectl describe services tomcat-load-balancer
```