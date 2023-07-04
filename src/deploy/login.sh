#!/usr/bin/env sh

set -e

echo "Logging in to ${AZURE_TENANT_ID}"
az login --service-principal \
    --username "${AZURE_CLIENT_ID}" \
    --tenant "${AZURE_TENANT_ID}" \
    --password "${AZURE_CLIENT_SECRET}" \
    --output none

echo "Setting subscription ${AZURE_SUBSCRIPTION_ID}"
az account set --subscription "${AZURE_SUBSCRIPTION_ID}" \
    --output none
