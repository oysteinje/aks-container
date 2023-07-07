param name string
param location string = resourceGroup().location

module vnet '../resourceModules/modules/network/virtual-networks/main.bicep' = {
  name: 'vnetDeploy'
  params: {
    name: 'vnet-${name}'
    location: location
    addressPrefixes: [
      '10.1.0.0/16'
    ]
    subnets: [
      {
        name: '${name}-system'
        addressPrefix: '10.1.0.0/26'
      }
    ]
  }
}

module aks '../resourceModules/modules/container-service/managed-clusters/main.bicep' = {
  name: 'aksDeploy'
  params: {
    name: name
    location: location
    disableLocalAccounts: false
    primaryAgentPoolProfile: [
      {
        count: 3
        mode: 'System'
        name: 'systempool'
        vmSize: 'Standard_B2s'
        enableAutoScaling: false
        vnetSubnetID: vnet.outputs.subnetResourceIds.
      }
    ]
    enableDefaultTelemetry: false
    systemAssignedIdentity: true
  }
}
