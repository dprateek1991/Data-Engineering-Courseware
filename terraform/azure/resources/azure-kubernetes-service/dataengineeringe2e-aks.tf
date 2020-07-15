module "dataengineeringe2e_aks" {
  source                   = "../../modules/azurekubernetesservice/"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  cluster_name             = var.cluster_name
  kubernetes_version       = var.kubernetes_version
  network_plugin           = "azure"
  dns_service_ip           = "172.203.0.10"
  service_cidr             = "172.203.0.0/16"
  docker_bridge_cidr       = "172.204.0.1/16"
  vnet_id                  = var.vnet_id
  subnet_id                = var.subnet_id
  sp_password              = data.azurerm_key_vault_secret.aks_sp_password.value
  sp_application_id        = data.azurerm_key_vault_secret.aks_sp_application_id.value
  load_balancer_sku        = "Standard"

  default_node_pool = {
    vnet_subnet_id  = var.subnet_id
    min_count       = 1
    max_count       = 1
    os_disk_size_gb = 30
    max_pods        = 30
  }

  secondary_node_pool = [
    {
      name            = "secondpool"
      node_count      = 1
      min_count       = 1
      max_count       = 1
      os_disk_size_gb = 30
      vnet_subnet_id  = var.subnet_id
      max_pods        = 30
      node_taints     = ["kubernetes.azure.com/scalesetpriority=spot:NoSchedule"]
    }
  ]

  tags = {
    Team = var.team
  }
}
