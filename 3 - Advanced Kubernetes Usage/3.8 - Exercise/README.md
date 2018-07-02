# Exercise

Create PersistemVolume

```/bin/bash
sudo kubectl create -f local-volume.yaml
```

Create ghost service

```/bin/bash
sudo kubectl create -f ghost-deployment.yaml
```

Create auto-scaling

```/bin/bash
sudo kubectl autoscale deployment ghost --cpu-percent=50 --min=1 --max=10
```

Create Pod busybox to simulate load using infite HTTP request to wordpress to spike CPU and see how HPA responds

```/bin/bash
sudo kubectl run -it load-generator --image=busybox /bin/sh
```

Run this command inside the Pod busybox

```/bin/bash
container# while true; do wget -q -O- http://ghost.default.svc.cluster.local; done
```

Open another instance of the terminal and check HPA

```/bin/bash
sudo kubectl get hpa
```