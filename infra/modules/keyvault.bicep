param namePrefix string
param location string
param tenantId string
param objectId string // This will be the objectId of a user, service principal, or managed identity

resource kv 'Microsoft.KeyVault/vaults@2022-11-01' = {
  name: '${namePrefix}-kv'
  location: location
  properties: {
    tenantId: tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenantId
        objectId: objectId
        permissions: {
          secrets: [
            'get'
            'set'
            'list'
            'delete'
          ]
        }
      }
    ]
    enableSoftDelete: true
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: false
  }
}
