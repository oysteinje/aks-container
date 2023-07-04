#!/bin/bash

set -e

echo "Connecting to cluster"
az aks get-credentials \
    --name "${CLUSTER_NAME}" \
    --resource-group "${CLUSTER_RESOURCE_GROUP}" \
    --admin

echo "Succesfully connected to ${CLUSTER_NAME} as $(kubectl config current-context)"
