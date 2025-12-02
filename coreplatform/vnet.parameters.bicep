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
      "value": "/subscriptions/88733ed8-40ea-48b0-a7f3-34bd815c626f/resourceGroups/networkmanager/providers/Microsoft.Network/networkManagers/ConnectivityNetworkManager/ipamPools/ipampool" 
    },
    "vnetNumberOfIpAddresses": {
      "value": "65536"
    },
    "subnetNumberOfIpAddresses": { 
      "value": "256"
    }
  }
}
