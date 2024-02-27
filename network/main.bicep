@description('Specifies the location for resources.')
param location string = 'westus2'
@description('Specifies the resourcegroup name.')
param rgName string = 'kainetworkrg'
@description('Specifies the vnetName name.')
param virtualNetworkName string = 'kainetwork'
param sshKey string = 'sshkey'

// ============ main.bicep ==========
targetScope = 'subscription'

// Creating resource group
@description('Creates vnet resourcegroup.')
resource resourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgName
  location: location
}

//Create Vnet
module virtualNetwork '../core/network/virtualnetwork.bicep' = {
  name: 'virtualnetwork'
  scope: resourceGroup
  params: {
    virtualNetworkName: virtualNetworkName
    subnetName: 'subnet1'
    location: resourceGroup.location
  }
}


// Creating compute resourceg group
@description('Creates compute resourcegroup')
resource computeResourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'kai-compute'
  location: location 
}

module aks '../core/containers/kubernetes.bicep' = {
  scope: computeResourceGroup
  name: 'kaiks'
  params: {
    sshKey: sshKey
    location: location
  }
}
