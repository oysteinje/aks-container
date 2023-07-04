param name string
param location string = resourceGroup().location

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
      }
    ]
    enableDefaultTelemetry: false
    systemAssignedIdentity: true
  }
}
