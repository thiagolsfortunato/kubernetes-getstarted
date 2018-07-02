# Volume on AWS

Create environment

```/bin/bash
export KOPS_STATE_STORE=s3://bucket-k8s-us-east-2
```

Create kops cluster

```/bin/bash
kops create cluster bucket-k8s.demo.k8s.local --zones us-east-2a --yes
```

Kops validate cluster

```/bin/bash
kops validate cluster
```

Deploy worpress-mysql on cluster

```/bin/bash
kubectl apply -f mysql-deployment.yaml
```

Deploy worpress on cluster

```/bin/bash
kubectl apply -f wordpress-deployment.yaml
```

Describe persistentvolumes

```/bin/bash
kubectl describe persistentvolumes
```

Describe kubectl service wordpress

```/bin/bash
kubectl describe service wordpress
```

Delete kops cluster

```/bin/bash
kops delete cluster --name=bucket-k8s.demo.k8s.local --yes
```