variable "storage_account_name" {
  type        = string
  description = "Storage Account name"
}

variable "aml_storage_account_name" {
  type        = string
  description = "Storage Account name"
}


variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "excluded_ips" { 
  type        = list
  default     = []
  description = "Home ips to exclude"
}

variable "containers" {
  type        = list
  description = "Storage Account Containers"
}

variable "aml_containers" {
  type        = list
  description = "Storage Account Containers"
}