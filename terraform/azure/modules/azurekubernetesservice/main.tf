resource "azurerm_kubernetes_cluster" "cluster" {
  lifecycle {
    ignore_changes = [
      service_principal,
      default_node_pool[0].node_count
    ]
  }

  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  api_server_authorized_ip_ranges   = var.api_server_authorized_ip_ranges

  network_profile {
    network_plugin     = var.network_plugin
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
    service_cidr       = var.service_cidr
    load_balancer_sku  = var.load_balancer_sku
  }

  role_based_access_control {
    enabled = true
  }

  default_node_pool {
    name  = lookup(var.default_node_pool, "name", "defaultpool")
    node_count = lookup(var.default_node_pool, "count", 1)
    vm_size = lookup(var.default_node_pool, "vm_size", "Standard_B2S")
    availability_zones = lookup(var.default_node_pool, "availability_zones", [])
    enable_auto_scaling = lookup(var.default_node_pool, "enable_auto_scaling", true)
    enable_node_public_ip = lookup(var.default_node_pool, "enable_node_public_ip", false)
    min_count = lookup(var.default_node_pool, "min_count", 1)
    max_count = lookup(var.default_node_pool, "max_count", 3)
    max_pods = lookup(var.default_node_pool, "max_pods", 30)
    node_taints = lookup(var.default_node_pool, "node_taints", [])
    os_disk_size_gb = lookup(var.default_node_pool, "os_disk_size_gb", 1)
    type = lookup(var.default_node_pool, "type", "VirtualMachineScaleSets")
    vnet_subnet_id = lookup(var.default_node_pool, "vnet_subnet_id", null)
  }

  service_principal {
    client_id     = var.sp_application_id
    client_secret = var.sp_password
  }

  tags = merge(
    var.tags,
    {
      "Version" = var.kubernetes_version
      "Name"    = var.cluster_name
    },
  )
}

resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {
  count      = length(var.secondary_node_pool)
  lifecycle{
    ignore_changes = [
      node_count
    ]
  }
  kubernetes_cluster_id = azurerm_kubernetes_cluster.cluster.id
  name  = lookup(var.secondary_node_pool[count.index], "name", "spot-${length(var.secondary_node_pool)}")
  node_count = lookup(var.secondary_node_pool[count.index], "count", 1)
  vm_size = lookup(var.secondary_node_pool[count.index], "vm_size", "Standard_A2_v2")
  availability_zones = lookup(var.secondary_node_pool[count.index], "availability_zones", [])
  enable_auto_scaling = lookup(var.secondary_node_pool[count.index], "enable_auto_scaling", true)
  enable_node_public_ip = lookup(var.secondary_node_pool[count.index], "enable_node_public_ip", false)
  min_count = lookup(var.secondary_node_pool[count.index], "min_count", 1)
  max_count = lookup(var.secondary_node_pool[count.index], "max_count", 3)
  max_pods = lookup(var.secondary_node_pool[count.index], "max_pods", 30)
  node_taints = lookup(var.secondary_node_pool[count.index], "node_taints", [])
  os_disk_size_gb = lookup(var.secondary_node_pool[count.index], "os_disk_size_gb", 1)
  vnet_subnet_id = lookup(var.secondary_node_pool[count.index], "vnet_subnet_id", null)
  priority  = "Spot"
  eviction_policy = "Delete"
  spot_max_price  =  -1
}