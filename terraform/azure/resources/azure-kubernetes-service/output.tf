output "kube_admin_config_host" {
  value       = module.dataengineeringe2e_aks.kube_admin_config_host
  description = "The Kubernetes cluster server host"
}

output "kube_admin_config_client_certificate" {
  value       = module.dataengineeringe2e_aks.kube_admin_config_client_certificate
}

output "kube_admin_config_client_key" {
  value       = module.dataengineeringe2e_aks.kube_admin_config_client_key
}

output "kube_admin_config_client_cluster_ca_certificate" {
  value       = module.dataengineeringe2e_aks.kube_admin_config_client_cluster_ca_certificate
}

output "kube_admin_config_username" {
  value       = module.dataengineeringe2e_aks.kube_admin_config_username
}

output "kube_admin_config_password" {
  value       = module.dataengineeringe2e_aks.kube_admin_config_client_password
}
