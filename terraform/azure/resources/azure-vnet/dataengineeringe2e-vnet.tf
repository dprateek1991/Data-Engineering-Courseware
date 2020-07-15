module "dataengineeringe2e_vnet" {
    source = "../../modules/vnet"
    vnet_name = var.vnet_name
    resource_group_name = var.resource_group_name
    location = var.location
    vnet_address_space = var.vnet_address_space
    subnet_name = var.subnet_name
    subnet_address_space = var.subnet_address_space
    subnet_service_endpoints = var.subnet_service_endpoints
    route_table_name = var.route_table_name
    nsg_name = var.nsg_name
}