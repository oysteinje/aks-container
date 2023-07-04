#!/bin/bash

set -e

echo "Creating Resource Group: ${CLUSTER_RESOURCE_GROUP}"

az group create --name "${CLUSTER_RESOURCE_GROUP}" \
    --location "${LOCATION}" \
    --output none

echo "Starting deployment of: ${CLUSTER_NAME}"

az deployment group create --name "$(date +%s%N)" \
    --resource-group "${CLUSTER_RESOURCE_GROUP}" \
    --template-file "main.bicep" \
    --parameters "main.bicepparam" \
    --output none

echo "Deployment of ${CLUSTER_NAME} completed."
