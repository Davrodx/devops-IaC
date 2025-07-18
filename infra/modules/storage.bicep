param namePrefix string
param location string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'myappwebapp657290'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

output storageAccountName string = storageAccount.name
