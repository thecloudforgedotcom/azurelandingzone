resource symbolicname 'Microsoft.Storage/storageAccounts@2025-06-01' = {
  scope: resourceSymbolicName or scope
  extendedLocation: {
    name: 'string'
    type: 'string'
  }
  identity: {
    type: 'string'
    userAssignedIdentities: {
      {customized property}: {}
    }
  }
  kind: 'string'
  location: 'string'
  name: 'string'
  placement: {
    zonePlacementPolicy: 'string'
  }
  properties: {
    accessTier: 'string'
    allowBlobPublicAccess: bool
    allowCrossTenantReplication: bool
    allowedCopyScope: 'string'
    allowSharedKeyAccess: bool
    azureFilesIdentityBasedAuthentication: {
      activeDirectoryProperties: {
        accountType: 'string'
        azureStorageSid: 'string'
        domainGuid: 'string'
        domainName: 'string'
        domainSid: 'string'
        forestName: 'string'
        netBiosDomainName: 'string'
        samAccountName: 'string'
      }
      defaultSharePermission: 'string'
      directoryServiceOptions: 'string'
      smbOAuthSettings: {
        isSmbOAuthEnabled: bool
      }
    }
    customDomain: {
      name: 'string'
      useSubDomainName: bool
    }
    defaultToOAuthAuthentication: bool
    dnsEndpointType: 'string'
    dualStackEndpointPreference: {
      publishIpv6Endpoint: bool
    }
    enableExtendedGroups: bool
    encryption: {
      identity: {
        federatedIdentityClientId: 'string'
        userAssignedIdentity: 'string'
      }
      keySource: 'string'
      keyvaultproperties: {
        keyname: 'string'
        keyvaulturi: 'string'
        keyversion: 'string'
      }
      requireInfrastructureEncryption: bool
      services: {
        blob: {
          enabled: bool
          keyType: 'string'
        }
        file: {
          enabled: bool
          keyType: 'string'
        }
        queue: {
          enabled: bool
          keyType: 'string'
        }
        table: {
          enabled: bool
          keyType: 'string'
        }
      }
    }
    geoPriorityReplicationStatus: {
      isBlobEnabled: bool
    }
    immutableStorageWithVersioning: {
      enabled: bool
      immutabilityPolicy: {
        allowProtectedAppendWrites: bool
        immutabilityPeriodSinceCreationInDays: int
        state: 'string'
      }
    }
    isHnsEnabled: bool
    isLocalUserEnabled: bool
    isNfsV3Enabled: bool
    isSftpEnabled: bool
    keyPolicy: {
      keyExpirationPeriodInDays: int
    }
    largeFileSharesState: 'string'
    minimumTlsVersion: 'string'
    networkAcls: {
      bypass: 'string'
      defaultAction: 'string'
      ipRules: [
        {
          action: 'Allow'
          value: 'string'
        }
      ]
      ipv6Rules: [
        {
          action: 'Allow'
          value: 'string'
        }
      ]
      resourceAccessRules: [
        {
          resourceId: 'string'
          tenantId: 'string'
        }
      ]
      virtualNetworkRules: [
        {
          action: 'Allow'
          id: 'string'
          state: 'string'
        }
      ]
    }
    publicNetworkAccess: 'string'
    routingPreference: {
      publishInternetEndpoints: bool
      publishMicrosoftEndpoints: bool
      routingChoice: 'string'
    }
    sasPolicy: {
      expirationAction: 'string'
      sasExpirationPeriod: 'string'
    }
    supportsHttpsTrafficOnly: bool
  }
  sku: {
    name: 'string'
  }
  tags: {
    {customized property}: 'string'
  }
  zones: [
    'string'
  ]
}
