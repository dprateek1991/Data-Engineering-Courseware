module "dataengineeringe2eappinsights" {
    source              =   "../../modules/applicationinsights"
    name                =   var.name
    resource_group_name =   var.resource_group_name
}