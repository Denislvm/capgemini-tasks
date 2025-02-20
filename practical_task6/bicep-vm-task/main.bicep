param location string = 'centralus'
param vmSize string = 'Standard_B2s'

module network 'network.bicep' = {
  name: 'networkModule'
  params: {
    location: location
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'diagstorage${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

// Deploy VM
module vm 'vm.bicep' = {
  name: 'vmModule'
  params: {
    location: location
    vmSize: vmSize
    subnetId: network.outputs.vmSubnetId
    storageAccountName: storageAccount.name
  }
}
