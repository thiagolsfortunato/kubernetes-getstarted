# Masters

## K8S Architecture items (Componentes High Availability)

* master
  * kube-apiserver: run all master node ();
  * kube-controller-manager;
  * kube-scheduler;
* etcd: should be run all master node (store key:value pairs that is data in a k8s cluster)

## Kops

Kops helps you create, destroy, upgrade and maintain production-grade, highly available, Kubernetes clusters from the command line.
AWS (Amazon Web Services) is currently officially supported, with GCE in beta support , and VMware vSphere in alpha, and other platforms planned.

### Install Kops

```/bin/bash
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl-s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
sudo chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
```

Install CLI AWS

[Link AWS](https://docs.aws.amazon.com/cli/latest/userguide/awscli-install-linux.html)

```/bin/bash
pip install awscli --upgrade --user
```

Check version

```/bin/bash
aws --version
```

Upgrade lastest version aws cli

```/bin/bash
pip install awscli --upgrade --user
```

Configure your aws cli (AWS > IAM > Access Key)

```/bin/bash
aws configure
```

Create aws s3 bucket

```/bin/bash
aws s3api create-bucket --bucket bucket-k8s-us-east-2 --region us-east-2 --create-bucket-configuration LocationConstraint=us-east-2
```

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

Get kops nodes

```/bin/bash
kubectl get nodes --show-labels
```

SSH to master -> FAIL!!

```/bin/bash
ssh -i ~/.ssh/id_rsa admin@api.bucket-k8s.demo.k8s.local
```

Get master public DNS from AWS console and retry

```/bin/bash
ssh -i ~/.ssh/id_rsa admin@[master public DNS]
```

Log from kube-apiserver

```/bin/bash
cat /var/log/kube-apiserver.log
```

List docker containers

```/bin/bash
sudo docker container ls
```

Get deployments from namespace kube-system

```/bin/bash
kubectl get deployments --namespace=kube-system
```

Delete kops cluster

```/bin/bash
kops delete cluster --name=bucket-k8s.demo.k8s.local --yes
```