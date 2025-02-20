param location string
param vmSize string
param subnetId string
param storageAccountName string
param adminUsername string = 'azureuser'

resource publicIP 'Microsoft.Network/publicIPAddresses@2024-05-01' = {
  name: 'myPublicIP'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2024-05-01' = {
  name: 'myNIC'
  location: location
  properties: {
    ipConfigurations: [{
      name: 'ipConfig1'
      properties: {
        subnet: {
          id: subnetId
        }
        publicIPAddress: {
          id: publicIP.id
        }
      }
    }]
  }
}

// Linux Virtual Machine
resource vm 'Microsoft.Compute/virtualMachines@2024-11-01' = {
  name: 'myLinuxVM'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: 'myvm'
      adminUsername: adminUsername
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [{
            path: '/home/azureuser/.ssh/authorized_keys'
            keyData: 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDsC2xbqO6SXLiEjdIDzrN6hSf00fmIPcwitg7WlU36q slyusa@gmail.com'
          }]
        }
      }
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
      }
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts-gen2'
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [{
        id: nic.id
      }]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: 'https://${storageAccountName}.blob.core.windows.net/'
      }
    }
  }
}

output publicIPId string = publicIP.id

