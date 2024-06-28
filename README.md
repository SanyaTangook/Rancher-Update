# Rancher-Update

<details >
<summary>Shell Scripting</summary>

- Dowload Shell Scripting

  ```bash
  curl -fsSL -o read-rancher.sh https://raw.githubusercontent.com/SanyaTangook/Rancher-Update/main/read-rancher.sh
  ```

- Run Shell

  ```bash
  chmod u+x read-rancher.sh
  ./read-rancher.sh
  ```

</details>
<details>
<summary>Use Helm (recommend) </summary>

- install Helm

```bash
> curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
> chmod 700 get_helm.sh
> ./get_helm.sh
```

> Back Up Config rancher

```bash
helm get values rancher -n cattle-system -o yaml > values.yaml

helm upgrade rancher rancher-stable/rancher \
  --namespace cattle-system \
  -f values.yaml \
  --set global.cattle.psp.enabled=false \
  --version={version}
```

</details>

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

## if you use Shell Scripting
<details>
<summary> Edit Version Rancher </summary>

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

</details>

## Wait for Rancher to be rolled out
  
```bash
kubectl -n cattle-system rollout status deploy/rancher
or
kubectl get all -n cattle-system
```

### Upgrade Rancher to the latest version with all your settings.

Take all the values from the previous step and append them to the command using `--set key=value.`

For Kubernetes v1.25 or later, set `global.cattle.psp.enabled` to `false` when using Rancher v2.7.2-v2.7.4. This is not necessary for Rancher v2.7.5 and above, but you can still manually set the option if you choose.

```bash
helm upgrade rancher rancher-<CHART_REPO>/rancher \
  --namespace cattle-system \
  -f values.yaml \
  --set global.cattle.psp.enabled=false \
  --version=2.6.8
```

Ref : [RancherDoc](https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster/upgrades)
