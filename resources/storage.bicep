@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
@description('Storage account type.')
param storageAccountType string = 'Standard_LRS'

@description('Location for all resources.')
param location string = resourceGroup().location

param storageAccountName string = 'storage${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
//  scope: resourceSymbolicName or scope
//  extendedLocation: {
//    name: 'string'
//    type: 'string'
//  }
//  identity: {
//    type: 'string'
//    userAssignedIdentities: {
//      {customized property}: {}
//    }
//  }
  kind: 'StorageV2'
  location: location
  name: storageAccountName
//  placement: {
//    zonePlacementPolicy: 'string'
//  }
//  properties: {
//    accessTier: 'string'
//    allowBlobPublicAccess: bool
//    allowCrossTenantReplication: bool
//    allowedCopyScope: 'string'
//    allowSharedKeyAccess: bool
//    azureFilesIdentityBasedAuthentication: {
//      activeDirectoryProperties: {
//        accountType: 'string'
//        azureStorageSid: 'string'
//        domainGuid: 'string'
//        domainName: 'string'
//        domainSid: 'string'
//        forestName: 'string'
//        netBiosDomainName: 'string'
//        samAccountName: 'string'
//      }
//      defaultSharePermission: 'string'
//      directoryServiceOptions: 'string'
//      smbOAuthSettings: {
//        isSmbOAuthEnabled: bool
//      }
//    }
//    customDomain: {
//      name: 'string'
//      useSubDomainName: bool
//    }
//    defaultToOAuthAuthentication: bool
//    dnsEndpointType: 'string'
//    dualStackEndpointPreference: {
//      publishIpv6Endpoint: bool
//    }
//    enableExtendedGroups: bool
//    encryption: {
//      identity: {
//        federatedIdentityClientId: 'string'
//        userAssignedIdentity: 'string'
//      }
//      keySource: 'string'
//      keyvaultproperties: {
//        keyname: 'string'
//        keyvaulturi: 'string'
//        keyversion: 'string'
//      }
//      requireInfrastructureEncryption: bool
//      services: {
//        blob: {
//          enabled: bool
//          keyType: 'string'
//        }
//        file: {
//          enabled: bool
//          keyType: 'string'
//        }
//        queue: {
//          enabled: bool
//          keyType: 'string'
//        }
//        table: {
//          enabled: bool
//          keyType: 'string'
//        }
//      }
//    }
//    geoPriorityReplicationStatus: {
//      isBlobEnabled: bool
//    }
//    immutableStorageWithVersioning: {
//      enabled: bool
//      immutabilityPolicy: {
//        allowProtectedAppendWrites: bool
//        immutabilityPeriodSinceCreationInDays: int
//        state: 'string'
//      }
//    }
//    isHnsEnabled: bool
//    isLocalUserEnabled: bool
//    isNfsV3Enabled: bool
//    isSftpEnabled: bool
//    keyPolicy: {
//      keyExpirationPeriodInDays: int
//    }
//    largeFileSharesState: 'string'
//    minimumTlsVersion: 'string'
//    networkAcls: {
//      bypass: 'string'
//      defaultAction: 'string'
//      ipRules: [
//        {
//          action: 'Allow'
//          value: 'string'
//        }
//      ]
//      ipv6Rules: [
//        {
//          action: 'Allow'
//          value: 'string'
//        }
//      ]
//      resourceAccessRules: [
//        {
//          resourceId: 'string'
//          tenantId: 'string'
//        }
//      ]
//      virtualNetworkRules: [
//        {
//          action: 'Allow'
//          id: 'string'
//          state: 'string'
//        }
//      ]
//    }
//    publicNetworkAccess: 'string'
//    routingPreference: {
//      publishInternetEndpoints: bool
//      publishMicrosoftEndpoints: bool
//      routingChoice: 'string'
//    }
//    sasPolicy: {
//      expirationAction: 'string'
//      sasExpirationPeriod: 'string'
//    }
//    supportsHttpsTrafficOnly: bool
//  }
  sku: {
    name: storageAccountType
  }
//  tags: {
//    {customized property}: 'string'
//  }
//  zones: [
//    'string'
//  ]
}
