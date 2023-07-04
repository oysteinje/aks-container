#!/bin/bash

set -e

az aks show \
    --name "${CLUSTER_NAME}" \
    --resource-group "${CLUSTER_RESOURCE_GROUP}" \
