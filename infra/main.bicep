param location string = resourceGroup().location
param namePrefix string = 'demo030303' // Use something unique
param tenantId string
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
