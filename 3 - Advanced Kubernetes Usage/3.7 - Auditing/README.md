# Auditing

Auditing provides a security-relevant chronological set of records documenting the sequence of activities

## Audit ?!

What happened, why, by whon, on what, where, how it was initiated and where was it going ?

## Audit Policy

Define what should be logged/saved

Stop minikube

```/bin/bash
sudo minikube stop
```

Define audit policy

```/bin/bash
cat audit-policy.yaml
```

Copy audit policy to minikube's host folder

```/bin/bash
sudo cp audit-policy.yaml ~/.minikube/addons
```

Define start minikube

```/bin/bahs
cat minikubeStartWithAudit.sh
```

Connect to minikune

```/bin/bash
sudo minikube ssh
```

Read log

```/bin/bash
minikube# cat /var/logs/audit.log
```

Read json format

```/bin/bash
minikube# cat /var/logs/audit.log | jq .
```

Loggout minikube

```/bin/bash
minikyube# exit
```