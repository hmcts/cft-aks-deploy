#!/usr/bin/env bash

environment="$CURRENT_ITER_ENVIRONMENT"
aks_name=`yq ".environments.$environment.aks_name" ./updatecli/values.github-action.yaml`
aks_resource_group=`yq ".environments.$environment.aks_resource_group" ./updatecli/values.github-action.yaml`
aks_subscription=`yq ".environments.$environment.aks_subscription" ./updatecli/values.github-action.yaml`

echo "Before-------"
echo "${aks_name}"
echo "${aks_resource_group}"
echo "${aks_subscription}"
echo "${environment}"
/usr/local/bin/kubelogin --version
az account set -s "${aks_subscription}"

echo "Trying cluster ${aks_name} in RG ${aks_resource_group}"
az aks get-credentials \
    --resource-group "${aks_resource_group}"\
    --name "${aks_name}"
#$(kubectl get pods)
pluto detect-helm -o yaml -v 5 --target-versions k8s=v1.26.0
