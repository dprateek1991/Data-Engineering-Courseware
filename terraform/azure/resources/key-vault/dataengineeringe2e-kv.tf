module "dataengineeringe2ekv" {
  source                = "../../modules/keyvault/"
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  tenant_id             = var.tenant_id
  bypass                = "AzureServices"
  excluded_ips          = var.excluded_ips
  admin_users           = [
    var.admin_users
  ]
}