{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "localSubscriptionId": {
      "value": "67676767-3434-1212-3434-121212121212" 
    },
    "localResourceGroup": {
      "value": "Network"
    },
    "localVnetName": { 
      "value": "Connectivity-VNet"
    },
    "remoteSubscriptionId": {
      "value": "67676767-3434-1212-3434-121212121212" 
    },
    "remoteResourceGroup": {
      "value": "NetworkRG"
    },
    "remoteVnetName": { 
      "value": "test-vnet"
    },    
    "localPeeringName": {
      "value": "peer-to-remoteVnetName" 
    },
    "remotePeeringName": {
      "value": "peer-to-localVnetName"
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
