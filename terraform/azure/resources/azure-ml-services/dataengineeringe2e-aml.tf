module "dataengineeringe2eaml" {
    source                      = "../../modules/azuremlservices"
    resource_group_name         = var.resource_group_name
    workspace_name              = var.workspace_name
    applicationInsightsName     = var.applicationInsightsName
    keyVaultName                = var.keyVaultName
    keyVaultURI                 = var.keyVaultURI
    storageAccountName          = var.storageAccountName
    containerRegistryName       = var.containerRegistryName
}