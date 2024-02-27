
param location string = resourceGroup().location
param adminUserName string = 'serveradmin'
param sshKey string


resource aksCluster 'Microsoft.ContainerService/managedClusters@2023-11-01' = {
  name: 'name'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    kubernetesVersion: '1.19.7'
    dnsPrefix: 'dnsprefix'
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: 3
        vmSize: 'Standard_DS2_v2'
        osType: 'Linux'
        mode: 'System'
      }
    ]
    linuxProfile: {
      adminUsername: adminUserName
      ssh: {
        publicKeys: [
          {
            keyData: sshKey
          }
        ]
      }
    }
  }
}

