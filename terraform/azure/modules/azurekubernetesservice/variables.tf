variable "location" {
  type        = string
  default     = "Southeast Asia"
  description = "Region in which the resources are located"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to use"
}

variable "cluster_name" {
  type        = string
  description = "Name given to the cluster create (also used as DNS prefix)"
}

variable "kubernetes_version" {
  type        = string
  default     = "1.15.11"
  description = "Kubernetes version to use"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the different resources"
}

variable "subnet_id" {
  description = "ID of the subnet in which the cluster will be running"
}

variable "vnet_id" {
  description = "ID of the vnet in which the cluster will be running"
}

variable "dns_service_ip" {
  default     = null
  description = "IP address within the Kubernetes services address range that will be used by cluster service discovery (kube-dns)"
}

variable "docker_bridge_cidr" {
  default     = null
  description = "IP address used as the Docker bridge IP address on nodes"
}

variable "service_cidr" {
  default     = null
  description = "The Network Range used by the Kubernetes services"
}

variable "sp_password" {
  type        = string
  description = "Default password for the service principal - Can be stored in vault"
}

variable "sp_application_id" {
  type        = string
}

variable "network_plugin" {
  description = "The network plugin to use for this cluster (kubenet or azure)"
  default     = "kubenet"
}

variable "default_node_pool" {
  type        = any
  description = "A default node pool, recommended with atleast 3 nodes, defined in locals"
  default     = {}
}

variable "secondary_node_pool" {
  type        = any
  description = "A secondary node pool, used to create more pools"
  default     = []
}

variable "api_server_authorized_ip_ranges" {
  type      = set(string)
  default   = null
}

variable "load_balancer_sku" {
  type      = string
  default   = "basic"
}
