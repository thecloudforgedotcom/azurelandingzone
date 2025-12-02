param location string = resourceGroup().location
param virtualNetworkName string = 'my-vnet'
param subnet1Name string = 'Subnet-1'
param subnet2Name string = 'Subnet-2'
param vnetAddressSpace string = '10.0.0.0/16'
param subnet1AddressSpace string = '10.0.1.0/24'
param subnet2AddressSpace string = '10.0.2.0/24'

@description('Resource ID of an existing IPAM pool')
param existingIpamPoolId string = '/subscriptions/88733ed8-40ea-48b0-a7f3-34bd815c626f/resourceGroups/networkmanager/providers/Microsoft.Network/networkManagers/ConnectivityNetworkManager/ipamPools/ipampool'

@description('Number of IP addresses for virtual network')
param vnetNumberOfIpAddresses string = '65536'

@description('Number of IP addresses for subnet')
param subnetNumberOfIpAddresses string = '256'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      ipamPoolPrefixAllocations: [
        {
          numberOfIpAddresses: vnetNumberOfIpAddresses
          pool: {
            id: existingIpamPoolId
          }
        }
      ]
    }
  }

  resource subnet1 'subnets' = {
    name: subnet1Name
    properties: {
      ipamPoolPrefixAllocations: [
        {
          numberOfIpAddresses: subnetNumberOfIpAddresses
          pool: {
            id: existingIpamPoolId
          }
        }
      ]
    }  
  }

  resource subnet2 'subnets' = {
    name: subnet2Name
    properties: {
      ipamPoolPrefixAllocations: [
        {
          numberOfIpAddresses: subnetNumberOfIpAddresses
          pool: {
            id: existingIpamPoolId
          }
        }
      ]
    }    
  }
}

output subnet1ResourceId string = virtualNetwork::subnet1.id
output subnet2ResourceId string = virtualNetwork::subnet2.id
