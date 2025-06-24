param namePrefix string
param location string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${namePrefix}-plan'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
  properties: {
    reserved: false
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'myapp'
  location: location
  kind: 'app'
  properties: {
    httpsOnly: true
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
      ]
    }
  }
}

output appServiceName string = webApp.name
output webAppUrl string = 'https://${webApp.name}.azurewebsites.net'
