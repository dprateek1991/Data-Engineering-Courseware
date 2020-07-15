variable "name" {
    type    = string    
}

variable "location" {
    type        = string
    default     = "Southeast Asia"
    description = "Region in which the resources are located"
}

variable "resource_group_name" {
    type        = string
    description = "Name of the resource group to use"
}

variable "sku" {
    type    = string
    default = "Basic"
}

variable "admin_enabled" {
    type    = bool
    default = false
}