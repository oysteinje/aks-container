#!/bin/bash

set -e

echo "Starting cluster: ${CLUSTER_NAME}"

az aks start \
    --name "${CLUSTER_NAME}" \
    --resource-group "${CLUSTER_RESOURCE_GROUP}" \
    --output none

echo "Cluster ${CLUSTER_NAME} is now started."
