// main.bicep

@description('Azure region for resource deployment')
param location string

@description('Prefix for naming resources')
param namePrefix string

@description('Azure Active Directory tenant ID')
param tenantId string

@description('Object ID for access policies (e.g., service principal or user)')
param objectId string

module kv 'modules/keyvault.bicep' = {
  name: 'kvDeployment'
  params: {
    namePrefix: namePrefix
    location: location
    tenantId: tenantId
    objectId: objectId
  }
}

module appService 'modules/appservice.bicep' = {
  name: 'appServiceDeployment'
  params: {
    namePrefix: namePrefix
    location: location
  }
}

module storage 'modules/storage.bicep' = {
  name: 'storageDeployment'
  params: {
    namePrefix: namePrefix
    location: location
  }
}
