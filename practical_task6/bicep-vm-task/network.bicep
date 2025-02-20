param location string

// Create Virtual Network
resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: 'myVnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
  }
}

// Create Subnet with NSG association
resource vmSubnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: 'vmSubnet'
  parent: vnet
  properties: {
    addressPrefix: '10.0.1.0/24'
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}

// Create NSG
resource nsg 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: 'myNSG'
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowSSH'
        properties: {
          priority: 1000
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '89.28.202.50'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

output vmSubnetId string = vmSubnet.id
