#!/bin/bash

set -e

echo "Deleting Resource Group: ${CLUSTER_RESOURCE_GROUP}"

az group delete \
    --name "${CLUSTER_RESOURCE_GROUP}" \
    --yes \
    --output none

echo "Deletion of ${CLUSTER_RESOURCE_GROUP} completed."
