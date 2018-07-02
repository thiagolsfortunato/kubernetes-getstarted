# Secrets

Objects of type secret are intended to hold sensitive information, such as passwords, OAuth tokens, and ssh keys.
secrets: key=value
Base64 encode

Create secret password using literal parameters

```/bin/bash
sudo kubectl create secret generic mysql-pass --from-literal=password=ROOT_PASSWORD
```

Create secret using file.txt

```/bin/bash
sudo kubectl create secret generic db-user-pass --from-file=secrets_file/user.txt --from-file=secrets_file/password.txt
```

Apply modifications on deployments

```/bin/bash
sudo kubectl apply -f mysql-deployment.yaml
sudo kubectl apply -f wordpress-deployment.yaml
```

Connect to wordpress

```/bin/bash
sudo minikube service wordpress --url
```