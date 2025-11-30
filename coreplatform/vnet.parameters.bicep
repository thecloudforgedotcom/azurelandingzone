{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "virtualNetworkName": {
      "value": "test-vnet" 
    },
    "subnet1Name": {
      "value": "Subnet-A"
    },
    "subnet2Name": { 
      "value": "Subnet-B"
    },
    "vnetAddressSpace": {
      "value": "10.0.0.0/16" 
    },
    "subnet1AddressSpace": {
      "value": "10.0.1.0/24"
    },
    "subnet2AddressSpace": { 
      "value": "10.0.2.0/24"
    }
  }
}
