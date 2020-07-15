module "dataengineeringe2e-aml-sa" {
    source                  = "../../modules/storage"
    storage_account_name    = var.aml_storage_account_name
    resource_group_name     = var.resource_group_name
    excluded_ips            = var.excluded_ips
    containers              = var.aml_containers
    is_hns_enabled          = false
}