param location string = resourceGroup().location
param namePrefix string = 'demo'
param tenantId string

module kv 'modules/keyvault.bicep' = {
  name: 'kvDeployment'
  params: {
    namePrefix: namePrefix
    location: location
    tenantId: tenantId
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
