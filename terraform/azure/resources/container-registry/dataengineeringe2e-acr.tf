module "dataengineeringe2eacr" {
    source              =   "../../modules/azurecontainerregistry"
    name                =   var.name
    resource_group_name =   var.resource_group_name
    admin_enabled       =   var.admin_enabled
}