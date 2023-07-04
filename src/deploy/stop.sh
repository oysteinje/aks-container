#!/bin/bash

set -e

echo "Stopping cluster: ${CLUSTER_NAME}"

az aks stop \
    --name "${CLUSTER_NAME}" \
    --resource-group "${CLUSTER_RESOURCE_GROUP}" \
    --output none

echo "Cluster ${CLUSTER_NAME} is now stopped."
