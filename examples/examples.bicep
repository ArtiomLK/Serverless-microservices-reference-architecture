targetScope = 'resourceGroup'
// ------------------------------------------------------------------------------------------------
// Deployment parameters
// ------------------------------------------------------------------------------------------------
// Sample tags parameters
var tags = {
  project: 'iPaaS'
  env: 'dev'
}

param location string = 'eastus2'
param project_n string = 'iPaaS'

@secure()
param sql_admin_login string

@secure()
param sql_admin_password string

// ------------------------------------------------------------------------------------------------
// Serverless Microservices Deployment Examples
// ------------------------------------------------------------------------------------------------

module sererlessMicroservices '../bicep/main.bicep' = {
  name: 'sererlessMicroservices'
  params: {
    sqlAdminLogin: sql_admin_login
    sqlAdminPassword: sql_admin_password
    staticWebAppLocation: location
    applicationName: project_n
    location: location
    resourceTags: tags
  }
}
