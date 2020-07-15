output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.cluster.id
  description = "The cluster id"
}

output "node_resource_group" {
  value       = azurerm_kubernetes_cluster.cluster.node_resource_group
  description = "The resource group auto-created for the kubernetes nodes"
}

output "kube_admin_config_host" {
  value       = azurerm_kubernetes_cluster.cluster.kube_admin_config.0.host
  description = "The Kubernetes cluster server host"
}

output "kube_admin_config_client_certificate" {
  value       = azurerm_kubernetes_cluster.cluster.kube_admin_config.0.client_certificate
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
}

output "kube_admin_config_client_key" {
  value       = azurerm_kubernetes_cluster.cluster.kube_admin_config.0.client_key
  description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
}

output "kube_admin_config_client_cluster_ca_certificate" {
  value       = azurerm_kubernetes_cluster.cluster.kube_admin_config.0.cluster_ca_certificate
  description = " Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
}

output "kube_admin_config_username" {
  value       = azurerm_kubernetes_cluster.cluster.kube_admin_config.0.username
  description = "A username used to authenticate to the Kubernetes cluster  ."
}

output "kube_admin_config_client_password" {
  value       = azurerm_kubernetes_cluster.cluster.kube_admin_config.0.password
  description = "A password or token used to authenticate to the Kubernetes cluster."
}
