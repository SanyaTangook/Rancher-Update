#!/usr/bin/bash
echo "ServiceAccount"
echo "-----------------"
kubectl  -n cattle-system get ServiceAccount | grep -w --color 'rancher'
echo "-----------------"

echo "ConfigMap"
echo "-----------------"
kubectl  -n cattle-system get ConfigMap | grep -w --color 'rancher-config'
echo "-----------------"

echo "ClusterRoleBinding"
echo "-----------------"
kubectl  -n cattle-system get ClusterRoleBinding  | grep -w --color 'rancher'
echo "-----------------"

echo "Deployment"
echo "-----------------"
kubectl  -n cattle-system get Deployment | grep -w --color 'rancher'
echo "-----------------"

echo "Service"
echo "-----------------"
kubectl  -n cattle-system get svc | grep -w --color 'rancher'
echo "-----------------"

echo "Issuer"
echo "-----------------"
kubectl  get Issuer | grep -w --color 'rancher'
echo "-----------------"

echo "input Yes to Update"
read update

if [[ $update == "yes" ]] 
then
    kubectl apply -f https://raw.githubusercontent.com/SanyaTangook/Rancher-Update/main/rancher-update.yaml 
else
    echo "STOP"
fi
