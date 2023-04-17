#!/usr/bin/env bash

environment="$CURRENT_ITER_ENVIRONMENT"
aks_name=`yq ".environments.$environment.aks_name" ./updatecli/values.github-action.yaml`
aks_resource_group=`yq ".environments.$environment.aks_resource_group" ./updatecli/values.github-action.yaml`
aks_subscription=`yq ".environments.$environment.aks_subscription" ./updatecli/values.github-action.yaml`

# get kubelogin
if ! kubelogin --version  &> /dev/null
then
    echo "Kubelogin could not be found.. Installing"
    wget -q https://github.com/Azure/kubelogin/releases/download/v0.0.9/kubelogin-linux-amd64.zip
    unzip kubelogin-linux-amd64.zip
    sudo mv bin/linux_amd64/kubelogin /usr/bin
    kubelogin convert-kubeconfig -l azurecli
fi

az account set -s "${aks_subscription}"

echo "Trying cluster ${aks_name} in RG ${aks_resource_group}"
az aks get-credentials \
    --resource-group "${aks_resource_group}"\
    --name "${aks_name}"\
    --admin

#$(kubectl get pods)
pluto detect-helm -o yaml -v 5 --target-versions k8s=v1.26.0
