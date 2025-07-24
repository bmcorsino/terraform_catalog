output "azurerm_kubernetes_cluster_id" {
  description = "Kubernetes cluster ID"
  value       = azurerm_kubernetes_cluster.main.id
}

output "azurerm_kubernetes_cluster_fqdn" {
  description = "Kubernetes cluster FQDN"
  value       = azurerm_kubernetes_cluster.main.fqdn
}

output "azurerm_kubernetes_cluster_node_resource_group" {
  description = "Kubernetes node RG"
  value       = azurerm_kubernetes_cluster.main.node_resource_group
}