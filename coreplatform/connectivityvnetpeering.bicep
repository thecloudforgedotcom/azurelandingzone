targetScope = 'subscription'

@description('Subscription ID of LOCAL VNet')
param localSubscriptionId string
@description('Resource group name of LOCAL VNet')
param localResourceGroup string
@description('Name of LOCAL VNet')
param localVnetName string

@description('Subscription ID of REMOTE VNet')
param remoteSubscriptionId string
@description('Resource group name of REMOTE VNet')
param remoteResourceGroup string
@description('Name of REMOTE VNet')
param remoteVnetName string

@description('Peering names')
param localPeeringName string = 'peer-to-${remoteVnetName}'
param remotePeeringName string = 'peer-to-${localVnetName}'

@description('Flags')
param allowVirtualNetworkAccess bool = true
param allowForwardedTraffic bool = false
param allowGatewayTransitOnLocal bool = false
param allowGatewayTransitOnRemote bool = false
param useRemoteGatewaysOnLocal bool = false
param useRemoteGatewaysOnRemote bool = false

// Build VNet IDs once and pass into modules
var localVnetId  = resourceId(localSubscriptionId, localResourceGroup, 'Microsoft.Network/virtualNetworks', localVnetName)
var remoteVnetId = resourceId(remoteSubscriptionId, remoteResourceGroup, 'Microsoft.Network/virtualNetworks', remoteVnetName)

// Deploy peering LOCAL -> REMOTE at the LOCAL RG scope
module localPeering 'connectivityvnetpeering.modules.bicep' = {
  name: 'local-to-remote-peering'
  scope: resourceGroup(localSubscriptionId, localResourceGroup)
  params: {
    myVnetName: localVnetName
    remoteVnetId: remoteVnetId
    peeringName: localPeeringName
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransitOnLocal
    useRemoteGateways: useRemoteGatewaysOnLocal
  }
}

// Deploy peering REMOTE -> LOCAL at the REMOTE RG scope
module remotePeering 'connectivityvnetpeering.modules.bicep' = {
  name: 'remote-to-local-peering'
  scope: resourceGroup(remoteSubscriptionId, remoteResourceGroup)
  params: {
    myVnetName: remoteVnetName
    remoteVnetId: localVnetId
    peeringName: remotePeeringName
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransitOnRemote
    useRemoteGate    useRemoteGateways: useRemoteGatewaysOnRemote
  }
}

output localPeeringId string = localPeering.outputs.peeringId
