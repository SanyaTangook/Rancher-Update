#!/usr/bin/bash
echo "ServiceAccount"
echo "-----------------"
kubectl  -n cattle-system get ServiceAccount | grep --color 'rancher'
echo "-----------------"

echo "ConfigMap"
echo "-----------------"
kubectl  -n cattle-system get ConfigMap | grep --color 'rancher-config'
echo "-----------------"

echo "ClusterRoleBinding"
echo "-----------------"
kubectl  -n cattle-system get ClusterRoleBinding  | grep --color 'rancher'
echo "-----------------"

echo "Deployment"
echo "-----------------"
kubectl  -n cattle-system get Deployment | grep --color 'rancher'
echo "-----------------"

echo "Service"
echo "-----------------"
kubectl  -n cattle-system get svc | grep --color 'rancher'
echo "-----------------"

echo "Issuer"
echo "-----------------"
kubectl  get Issuer | grep --color 'rancher'
echo "-----------------"


read update

if [$update == "yes"] 
then
    curl -o rancher-update.yaml https://raw.githubusercontent.com/SanyaTangook/Rancher-Update/main/rancher-update.yaml
else
    echo "STOP"
fi
