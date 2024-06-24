# Rancher-Update

> Dowload Shell Scripting
```bash
curl -fsSL -o read-rancher.sh https://raw.githubusercontent.com/SanyaTangook/Rancher-Update/main/read-rancher.sh
```
- Run Shell
```bash
chmod u+x read-rancher.sh
./read-rancher.sh
```

## Rancher Supported AWS EKS
Kubernetes | rancher | in yaml|
|:-------:|:-------:|:---:|
|v1.23-v1.24| 2.7.4|  |
|v1.23-v1.26| 2.7.5|  |
|v1.23-v1.26| 2.7.9| :heavy_check_mark:|
|v1.25-v1.27| 2.8.1|  |
|v1.25-v1.27| 2.8.2|  |
|v1.25-v1.28| 2.8.3|  |
|v1.25-v1.28| 2.8.4|  |

## Edit Version Rancher

- vim or nano read-update.sh
```bash
vim read-update.sh
or
nano read-update.sh
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
or
kubectl get all -n cattle-system
```

```bash
helm get values rancher -n cattle-system -o yaml > values.yaml

helm upgrade rancher rancher-stable/rancher \
  --namespace cattle-system \
  -f values.yaml \
  --version={version}
```
