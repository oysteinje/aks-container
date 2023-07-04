using './main.bicep'

param name = readEnvironmentVariable('CLUSTER_NAME')
param location = readEnvironmentVariable('LOCATION')
