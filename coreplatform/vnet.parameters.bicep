{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "virtualNetworkName": {
      "value": "other-test-vnet" 
    },
    "subnet1Name": {
      "value": "Subnet-A"
    },
    "subnet2Name": { 
      "value": "Subnet-B"
    },
    "existingIpamPoolId": {
      "value": "/subscriptions/67676767-3434-1212-3434-121212121212/resourceGroups/networkmanager/providers/Microsoft.Network/networkManagers/ConnectivityNetworkManager/ipamPools/ipampool" 
    },
    "vnetNumberOfIpAddresses": {
      "value": "65536"
    },
    "subnetNumberOfIpAddresses": { 
      "value": "256"
    }
  }
}
