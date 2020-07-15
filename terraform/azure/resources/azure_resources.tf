# Create Resource Group

module "resource_group_dataengineeringe2e" {
  source              = "./resource-group"
  resource_group_name = "dataengineeringe2e"
}

# Create Storage Accounts

module "storage_account_dataengineeringe2e" {
  source                   = "./storage-account"
  storage_account_name     = "dataengineeringe2e"
  aml_storage_account_name = "dataengineeringe2eaml"
  resource_group_name      = "dataengineeringe2e"
  excluded_ips             = ["58.182.67.217"]
  containers               = ["tfstate"]
  aml_containers           = ["aml"]
}

# Create Virtual Network, Subnet, Route Table, NSG

module "vnet_dataengineeringe2e" {
  source = "./azure-vnet"
  vnet_name = "dataengineeringe2e-vnet"
  resource_group_name = "dataengineeringe2e"
  location = "southeastasia"
  vnet_address_space = ["10.0.0.0/16"]
  subnet_name = "dataengineeringe2e-subnet"
  subnet_address_space = ["10.0.0.0/24"]
  route_table_name = "dataengineeringe2e-rt"
  nsg_name = "dataengineeringe2e-nsg"
}

# Create Key Vault

module "kv_dataengineeringe2e" {
  source                  = "./key-vault"
  name                    = "dataengineeringe2e-kv"  
  resource_group_name     = "dataengineeringe2e"
  admin_users             = var.admin_users
  location                = "southeastasia"
  tenant_id               = var.tenant_id
  excluded_ips            = ["58.182.67.217/32"]
}

# Create Azure Container Registry

# module "acr_dataengineeringe2e" {
#   source                  = "./container-registry"
#   name                    = "dataengineeringe2eacr"
#   resource_group_name     = "dataengineeringe2e"
#   admin_enabled           = true
# }

# Create Application Insights 

# module "appinsights_dataengineeringe2e" {
#   source                  = "./application-insights"
#   name                    = "dataengineeringe2e-appinsights"
#   resource_group_name     = "dataengineeringe2e"
# }

# Create Azure Machine Learning Workspace

# module "aml_dataengineeringe2e" {
#   source                      = "./azure-ml-services"
#   resource_group_name         = "dataengineeringe2e"
#   workspace_name              = "dataengineeringe2eaml"
#   applicationInsightsName     = "dataengineeringe2e-appinsights"
#   keyVaultName                = "dataengineeringe2e-kv"
#   keyVaultURI                 = "https://dataengineeringe2e-kv.vault.azure.net/"
#   storageAccountName          = "dataengineeringe2eaml"
#   containerRegistryName       = "dataengineeringe2eacr"
# }

# Create Azure Kubernetes Service Cluster

# module "aks_dataengineeringe2e" {
#  source              = "./azure-kubernetes-service"
#  cluster_name        = "dataengineeringe2e-aks"
#  resource_group_name = "dataengineeringe2e"
#  location            = "southeastasia"
#  team                = "DataEngineeringE2E"
#  kubernetes_version  = "1.15.11"
#  vnet_id             = "/subscriptions/${var.subscription_id}/resourceGroups/dataengineeringe2e/providers/Microsoft.Network/virtualNetworks/dataengineeringe2e-vnet"
#  subnet_id           = "/subscriptions/${var.subscription_id}/resourceGroups/dataengineeringe2e/providers/Microsoft.Network/virtualNetworks/dataengineeringe2e-vnet/subnets/dataengineeringe2e-subnet"
#  vault_id            = "/subscriptions/${var.subscription_id}/resourceGroups/dataengineeringe2e/providers/Microsoft.KeyVault/vaults/dataengineeringe2e-kv"
# }
