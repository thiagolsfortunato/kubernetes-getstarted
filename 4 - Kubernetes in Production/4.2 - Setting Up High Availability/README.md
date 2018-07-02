# Setting Up High Availability

REDUNDANCE = HIGH AVALIABILITY

Create aws s3 bucket

```/bin/bash
aws s3api create-bucket --bucket bucket-k8s-us-east-2 --region us-east-2 --create-bucket-configuration LocationConstraint=us-east-2
```

Create environment

```/bin/bash
export KOPS_STATE_STORE=s3://bucket-k8s-us-east-2
```

Create kops cluster in differents master zones, 3 nodes

```/bin/bash
kops create cluster bucket-k8s.demo.k8s.local --zones us-east-2a,us-east-2b,us-east-2c --node-count 3 --master-zones us-east-2a,us-east-2b,us-east-2c --yes
```

Kops validate cluster

```/bin/bash
kops validate cluster
```

Get kops nodes

```/bin/bash
kubectl get nodes
```

Deploy worpress-mysql on cluster

```/bin/bash
kubectl apply -f mysql-deployment.yaml
```

Deploy worpress on cluster

```/bin/bash
kubectl apply -f wordpress-deployment.yaml
```

Get deployments on cluster

```/bin/bash
kubectl get deployment
```

Describe deployments

```/bin/bash
kubectl describe deployment wordpress
```

Decribe service

```/bin/bash
kubectl describe service wordpress
```

Delete kops cluster

```/bin/bash
kops delete cluster --name=bucket-k8s.demo.k8s.local --yes
```