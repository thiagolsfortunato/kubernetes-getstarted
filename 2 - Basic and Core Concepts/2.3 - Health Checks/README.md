# Health Checks

## Probes

### Readiness Probes

To determine when Pod is READY, after started the container

### Liveness Probes

To determine when Pod is "HEALTHY" or "UNHEALTHY", after is become READY

Add healthy check

```/bin/bash
sudo kubectl apply -f ./deployment.yaml
```

Describe deployment tomcat-deployment

```/bin/bash
sudo kubectl describe deployment tomcat-deployment
```