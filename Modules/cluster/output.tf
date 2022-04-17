output "client_certificate" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.default.kube_config_raw

  sensitive = true
}

output "aks_cluster_fqdn" {
  value       = azurerm_kubernetes_cluster.default.fqdn
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
}

output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.default.id
  description = "The Kubernetes Managed Cluster ID."
}

output "kube_admin_config_host" {
  value       = azurerm_kubernetes_cluster.default.kube_config.0.host
  description = "The Kubernetes cluster server host."
}