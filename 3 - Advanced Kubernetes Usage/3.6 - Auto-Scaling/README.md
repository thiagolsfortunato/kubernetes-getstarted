# Auto-Scaling HPA

## Horizontal Pod Autoscaler

HPA facility that adjusts the number of replica of a Pod to match observe average CPU utilization.
HPA will create or delete a Pod based average CPU.

Deployment Pod

```/bin/bash
sudo kubectl apply -f wordpress-deployment.yaml
```

Create HPA

```/bin/bash
sudo kubectl autoscale deployment wordpress --cpu-percent=50 --min=1 --max=10
```

Get describe from deployment

```/bin/bash
sudo kubectl describe deployment wordpress
```

Create Pod busybox to simulate load using infite HTTP request to wordpress to spike CPU and see how HPA responds

```/bin/bash
sudo kubectl run -it load-generator --image=busybox /bin/sh
```

Run this command inside the Pod busybox

```/bin/bash
while true; do wget -q -O- http://wordpress.default.svc.cluster.local; done
```

Open another instance of the terminal and check HPA

```/bin/bash
sudo kubectl get hpa
```