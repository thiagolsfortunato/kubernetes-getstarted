# Replication

Get deployments

```/bin/bash
sudo kubectl get deployment
```

Status deployments

```/bin/bash
sudo kubectl rollout status deployment tomcat-deployment
```

Upadate image from deployment

```/bin/bash
sudo kubectl set image deployment/tomcat-deployment tomcat=tomcat:9.0.1

```

History of rollout of a deployment

```/bin/bash
sudo kubectl rollout history deployment/tomcat-deployment
```

Revision history of rollout of a deployment

```/bin/bash
sudo kubectl rollout history deployment/tomcat-deployment --revision=2
```