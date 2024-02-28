@description('Specifies the location for resources.')
param location string = 'westus2'
@description('Specifies the resourcegroup name.')
param rgName string = 'kainetworkrg'
@description('Specifies the vnetName name.')
param virtualNetworkName string = 'kainetwork'
param sshKey string = 'sshkey'

// ============ main.bicep ==========
// IMPORTANT>>>>>> STILL WIP>> CURRENTLY HOLDS BOTH NETWORKING AND COMPUTE !!!!! WILL REFACTOR LATER
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

//Create West1 cluster
module w1 '../core/containers/kubernetes.bicep' = {
  scope: computeResourceGroup
  name: 'aksw1'
  params: {
    sshKey: sshKey
    location: location
  }
}

//Create West2 Cluster
module w2 '../core/containers/kubernetes.bicep' = {
  scope: computeResourceGroup
  name: 'aksw2'
  params: {
    sshKey: sshKey
    location: location
  }
}
