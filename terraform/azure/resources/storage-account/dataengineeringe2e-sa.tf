module "dataengineeringe2e-sa" {
    source                  = "../../modules/storage"
    storage_account_name    = var.storage_account_name
    resource_group_name     = var.resource_group_name
    excluded_ips            = var.excluded_ips
    containers              = var.containers
}