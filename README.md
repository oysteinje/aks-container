# aks-container

The goal of this project is to quickly deploy, run, and connect to an Azure Kubernetes Service (AKS) cluster. The prerequisites for getting this working are:
- Docker
- A service principal with contributor access to a subscription.

**Note**: This project is intended for development purposes only and should not be used in production.

## Quickstart

Using BASH:

Set the value for the required environment variables:

``` sh
#!/bin/bash

export AZURE_CLIENT_ID=""
export AZURE_CLIENT_SECRET=""
export AZURE_TENANT_ID=""
export AZURE_SUBSCRIPTION_ID=""
export LOCATION=""
export CLUSTER_RESOURCE_GROUP=""
export CLUSTER_NAME=""
```

``` sh
docker run -it --rm \
    -e AZURE_CLIENT_ID \
    -e AZURE_CLIENT_SECRET \
    -e AZURE_TENANT_ID \
    -e AZURE_SUBSCRIPTION_ID \
    -e LOCATION \
    -e CLUSTER_RESOURCE_GROUP \
    -e CLUSTER_NAME \
    --network host \
    -p 9001:9001 \
    -p 8080:8080 \
    oysteinje/aks-container:0.0.1-dev \
    create
```

Using PowerShell:

``` powershell
$env:AZURE_CLIENT_ID = ""
$env:AZURE_CLIENT_SECRET = ""
$env:AZURE_TENANT_ID = ""
$env:AZURE_SUBSCRIPTION_ID = ""
$env:LOCATION = ""
$env:CLUSTER_RESOURCE_GROUP = ""
$env:CLUSTER_NAME = ""
```

``` powershell
docker run -it --rm `
    -e AZURE_CLIENT_ID `
    -e AZURE_CLIENT_SECRET `
    -e AZURE_TENANT_ID `
    -e AZURE_SUBSCRIPTION_ID `
    -e LOCATION `
    -e CLUSTER_RESOURCE_GROUP `
    -e CLUSTER_NAME `
    --network host `
    -p 9001:9001 `
    -p 8080:8080 `
    oystenje/aks-container:0.0.1-dev `
    create
```

After the cluster is created you can connect to the cluster by replacing `create` with `connect`. You should now be able to run `kubectl`, `flux`, and `helm` commands against the cluster. 

You can access the GitOps UI by running `browse` and navigate to http://localhost:9001. Username admin, password flux. 

When you are done you can run the same command again, but now replace `create` with `destroy`.

## Local development
For local development you must in addition set the following as environment variables:

``` sh
export IMAGE_NAME="aks-container"
export IMAGE_TAG="0.0.1-dev"
```

Then you can run: `./buildAndRun create`

This will build and run the image locally instead of pulling it from Docker hub.

# Roadmap 
- Kubernetes Operator that will self destruct the resource group after 24h 
https://devblogs.microsoft.com/cse/2021/11/11/azure-service-operators-a-kubernetes-native-way-of-deploying-azure-resources/

