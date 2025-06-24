param namePrefix string
param location string

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'WebAppPortfolio-appserviceplan'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  kind: 'linux'
  properties: {
    reserved: true  // 👈 required for Linux
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'WebAppDavDev01'
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: plan.id
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts'  // 👈 use Linux Node runtime
    }
  }
}
