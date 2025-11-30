
// This module deploys ONE peering at the resource group scope where the parent VNet lives.
targetScope = 'resourceGroup'

@description('Name of the VNet in THIS resource group')
param myVnetName string

@description('Resource ID of the REMOTE VNet (can be in another subscription/RG)')
param remoteVnetId string

@description('Peering name to create')
param peeringName string

@description('Flags')
param allowVirtualNetworkAccess bool = true
param allowForwardedTraffic bool = false
param allowGatewayTransit bool = false
param useRemoteGateways bool = false

// Parent VNet at the module's scope
resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' existing = {
  name: myVnetName
}

// Child peering resource (no scope here; must use parent)
resource peering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2024-05-01' = {
  name: peeringName
  parent: vnet
  properties: {
    remoteVirtualNetwork: {
      id: remoteVnetId
    }
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransit
    useRemoteGateways: useRemoteGateways
  }
}

output peeringId
