#!/usr/bin/env bash
set -e

PARAM_LIST=( PROJECT SERVICE ENVIRONMENT KEYVAULT SUBSCRIPTION_NAME CLUSTER_NAMES COMMAND AKS_KEYVAULT )

function usage() {
    echo ""
    echo "$0 ${PARAM_LIST[*]}"
    exit 0
}

function error_exit {
	echo "$1" 1>&2
  echo "Stopping..."
	exit 1
}


# Make sure the 8 arguments are passed
if [[ $# -lt 8 ]]
then
    usage
fi

echo "Params: $@"


chmod +x scripts/get-aks-credentials.sh
chmod +x scripts/create-custom-namespaces.sh
chmod +x scripts/create-cluster-admins.sh
chmod +x scripts/create-flux-githubkey-secret.sh
chmod +x scripts/install-flux.sh
chmod +x scripts/create-neuvector-azure-file-share.sh
chmod +x scripts/cleanup-sshkeys.sh

for cluster in ${6}; do 
  set -- "${@:1:5}" "$cluster" "${@:7:8}"

  echo "Starting Deployment"
  ./scripts/get-aks-credentials.sh "$@" || error_exit "ERROR: Unable to get AKS credentials"
  ./scripts/create-custom-namespaces.sh "$@" || error_exit "ERROR: Unable to create custom namespaces"
  ./scripts/create-cluster-admins.sh "$@" || error_exit "ERROR: Unable to create cluster admins"
  ./scripts/create-flux-githubkey-secret.sh "$@"|| error_exit "ERROR: Unable to create flux githubkey secret"
  ./scripts/install-flux.sh "$@"|| error_exit "ERROR: Unable to install flux"
  [[ $6 =~ ^(aat|ithc|perftest|prod)$ ]] && (./scripts/create-neuvector-azure-file-share.sh "$@"|| error_exit "ERROR: Unable to create Neuvector Azure File Shares")
  echo "Cleanup"
  ./scripts/cleanup-sshkeys.sh "$@" || error_exit "ERROR: Unable to Cleanup"
  echo "Deployment Complete"

done
