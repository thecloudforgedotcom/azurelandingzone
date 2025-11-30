targetScope = 'subscription'

@description('Subscription ID of the LOCAL VNet')
param localSubscriptionId string

@description('Resource group name of the LOCAL VNet')
param localResourceGroup string

@description('Name of the LOCAL VNet')
param localVnetName string

@description('Subscription ID of the REMOTE VNet')
param remoteSubscriptionId string

@description('Resource group name of the REMOTE VNet')
param remoteResourceGroup string

@description('Name of the REMOTE VNet')
param remoteVnetName string

@description('Peering name to create on the LOCAL VNet')
param localPeeringName string = 'peer-to-${remoteVnetName}'

@description('Peering name to create on the REMOTE VNet')
param remotePeeringName string = 'peer-to-${localVnetName}'

@description('Enable VNet‑to‑VNet traffic (usually true)')
param allowVirtualNetworkAccess bool = true

@description('Allow forwarded traffic across the peering')
param allowForwardedTraffic bool = false

@description('Allow gateway transit from the LOCAL to REMOTE (if remote VNet has a VPN/ER gateway). Only one side can UseRemoteGateways=true.')
param allowGatewayTransitOnLocal bool = false

@description('Allow gateway transit from the REMOTE to LOCAL (if local VNet has a VPN/ER gateway). Only one side can UseRemoteGateways=true.')
param allowGatewayTransitOnRemote bool = false

@description('Use remote gateways on the LOCAL VNet (set true only if the REMOTE side has allowGatewayTransitOnRemote=true)')
param useRemoteGatewaysOnLocal bool = false

@description('Use remote gateways on the REMOTE VNet (set true only if the LOCAL side has allowGatewayTransitOnLocal=true)')
param useRemoteGatewaysOnRemote bool = false

// ---- Safety checks ----
//var bothUseRemoteGateways = useRemoteGatewaysOnLocal && useRemoteGatewaysOnRemote
//var bothAllowGatewayTransit = allowGatewayTransitOnLocal && allowGatewayTransitOnRemote

//@allowed([ false ])
//param _blockBothRemoteGatewayUse bool = bothUseRemoteGateways

//@allowed([ false ])
//param _blockBothTransit bool = bothAllowGatewayTransit

// ---- Cross-scope references to existing VNets ----
resource localVnet 'Microsoft.Network/virtualNetworks@2024-05-01' existing = {
  name: localVnetName
  scope: resourceGroup(localSubscriptionId, localResourceGroup)
}

resource remoteVnet 'Microsoft.Network/virtualNetworks@2024-05-01' existing = {
  name: remoteVnetName
  scope: resourceGroup(remoteSubscriptionId, remoteResourceGroup)
}

// ---- LOCAL -> REMOTE peering (child resource of LOCAL VNet) ----
resource localToRemote 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2024-05-01' = {
  name: '${localVnet.name}/${localPeeringName}'
  scope: resourceGroup(localSubscriptionId, localResourceGroup)
  properties: {
    remoteVirtualNetwork: {
      id: remoteVnet.id
    }
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransitOnLocal
    useRemoteGateways: useRemoteGatewaysOnLocal
  }
  dependsOn: [
    localVnet
    remoteVnet
  ]
}

// ---- REMOTE -> LOCAL peering (child resource of REMOTE VNet) ----
resource remoteToLocal 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2024-05-01' = {
  name: '${remoteVnet.name}/${remotePeeringName}'
  scope: resourceGroup(remoteSubscriptionId, remoteResourceGroup)
  properties: {
    remoteVirtualNetwork: {
      id: localVnet.id
    }
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransitOnRemote
    useRemoteGateways: useRemoteGatewaysOnRemote
  }
  dependsOn: [
    localVnet
    remoteVnet
    localToRemote
   ]
}

// ---- Helpful outputs ----
output localPeeringId string = localToRemote.id
