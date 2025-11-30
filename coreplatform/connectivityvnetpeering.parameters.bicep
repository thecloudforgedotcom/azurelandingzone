{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "localSubscriptionId": {
      "value": "88733ed8-40ea-48b0-a7f3-34bd815c626f" 
    },
    "localResourceGroup": {
      "value": "Network"
    },
    "localVnetName": { 
      "value": "Connectivity-VNet"
    },
    "remoteSubscriptionId": {
      "value": "251e7659-d020-475e-8e12-cd873ed2596b" 
    },
    "remoteResourceGroup": {
      "value": "NetworkRG"
    },
    "remoteVnetName": { 
      "value": "test-vnet"
    },    
    "localPeeringName": {
      "value": 'peer-to-${remoteVnetName}' 
    },
    "remotePeeringName": {
      "value": 'peer-to-${localVnetName}'
    },
    "allowVirtualNetworkAccess": { 
      "value": true
    },
    "allowForwardedTraffic": {
      "value": false 
    },
    "allowGatewayTransitOnLocal": {
      "value": false
    },
    "allowGatewayTransitOnRemote": { 
      "value": false
    },
    "useRemoteGatewaysOnLocal": {
      "value": false
    },
    "useRemoteGatewaysOnRemote": { 
      "value": false
    }        
  }
}
