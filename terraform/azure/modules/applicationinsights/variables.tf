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

variable "team" {
    type        = string
    default     = "DataEngineeringE2E"
    description = "Name of Team"
}

variable "retention_in_days" {
    type        = string    
    default     = 30
    description = "Log Retention Days"
}
