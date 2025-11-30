
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

@description('Allow gateway transit from the LOCAL to REMOTE (if local VNet has a VPN/ER gateway to share)')
param allowGatewayTransitOnLocal bool = false

@description('Allow gateway transit from the REMOTE to LOCAL (if remote VNet has a VPN/ER gateway to share)')
param allowGatewayTransitOnRemote bool = false

@description('Use remote gateways on the LOCAL VNet (set true only if REMOTE side has allowGatewayTransitOnRemote=true)')
param useRemoteGatewaysOnLocal bool = false

@description('Use remote gateways on the REMOTE VNet (set true only if LOCAL side has allowGatewayTransitOnLocal=true)')
param useRemoteGatewaysOnRemote bool = false

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
// NOTE: child resources must use `parent:` and must NOT have `scope:`
resource localToRemote 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2024-05-01' = {
  name: localPeeringName           // child name ONLY
  parent: localVnet                // attach to parent VNet; no `scope` here
  properties: {
    remoteVirtualNetwork: {
      id: remoteVnet.id
    }
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransitOnLocal
    useRemoteGateways: useRemoteGatewaysOnLocal
  }
}

// ---- REMOTE -> LOCAL peering (child resource of REMOTE VNet) ----
resource remoteToLocal 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2024-05-01' = {
  name: remotePeeringName
  parent: remoteVnet
  properties: {
    remoteVirtualNetwork: {
      id: localVnet.id
    }
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    allowForwardedTraffic: allowForwardedTraffic
       allowGatewayTransit: allowGatewayTransitOnRemote
    useRemoteGateways: useRemoteGatewaysOnRemote
  }
}

// ---- Helpful outputs ----
output localPeeringId string = localToRemote.id
