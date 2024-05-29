# Rancher-Update

> Dowload Shell Scripting
```bash
curl -o read-rancher.sh https://raw.githubusercontent.com/SanyaTangook/Rancher-Update/main/read.sh
```
## Rancher Supported AWS EKS
Kubernetes | rancher |
|:-------:|:-------:|
|v1.23-v1.24| 2.7.4|
|v1.23-v1.26| 2.7.5|
|v1.23-v1.26| 2.7.9|
|v1.25-v1.27| 2.8.1|
|v1.25-v1.27| 2.8.2|
|v1.25-v1.28| 2.8.3|
|v1.25-v1.28| 2.8.4|

## Edit Version Rancher
```bash
curl -o read-update.sh https://raw.githubusercontent.com/SanyaTangook/Rancher-Update/main/rancher-update.yaml
```
- vim or nano read-update.sh
```bash
vim read-update.sh
```
- Edit tng all kind
```yaml
chart: rancher-{Version}
and
containers:
      - image: rancher/rancher: {Version}
```
- apply file Rancher
```bash
kubectl apply -f read-update.sh
```
- Wait for Rancher to be rolled out
```bash
kubectl -n cattle-system rollout status deploy/rancher
```
