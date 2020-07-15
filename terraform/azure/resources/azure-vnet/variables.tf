variable "location" {
  type        = string
  description = "Location of resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "subnet_service_endpoints" {
  type        = list(string)
  default     = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.AzureActiveDirectory", "Microsoft.AzureCosmosDB", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
}

variable "vnet_name" {
  type        = string
  description = "Virtual Network name"
}

variable "vnet_address_space" {
  type        = list
  description = "Virtual Network address space"
}

variable "subnet_address_space" {
  type        = list(string)
  description = "Subnet address space"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "nsg_name" {
  type        = string
  description = "NSG name"
}

variable "route_table_name" {
  type        = string
  description = "Route table name"
}