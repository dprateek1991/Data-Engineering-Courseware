variable "name" {
  type    =   string
}

variable "location" {
  type    =   string
  default =   "Southeast Asia"
}

variable "resource_group_name" {
  type    =   string
}

variable "enabled_for_disk_encryption" {
  type      =   bool
  default   =   true
}

variable "sku_name" {
  type      =   string
  default   =   "standard"
}

variable "excluded_ips" {
  type    =   list
  default =   []
}

variable "bypass" {
  type    =   string
  default = ""
}

variable "admin_users" {
  type    = list
  default = []
}

variable "tenant_id" {
  type    = string
}
