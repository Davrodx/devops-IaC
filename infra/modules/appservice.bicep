param namePrefix string
param location string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name:'${namePrefix}-web${uniqueString(resourceGroup().id)}
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
  name: 'myapp-webapp'
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
