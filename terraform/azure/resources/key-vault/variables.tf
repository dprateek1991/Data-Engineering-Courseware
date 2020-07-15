variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "tenant_id" {
  type        = string
}

variable "name" {
  type        = string
}

variable "admin_users" {
  type        = string
}

variable "excluded_ips" {
   type       = list
 }
