output "kube_config" {
  value = "${azurerm_kubernetes_cluster.aks.kube_config_raw}"
}

output "kubernetes_host" {
  value = "${azurerm_kubernetes_cluster.aks.kube_config.0.host}"
}

output "acr_fqdn" {
  value = "${azurerm_container_registry.aks-acr.login_server}"
}

output "acr_name" {
  value ="${azurerm_container_registry.aks-acr.name}"
}

output "rg" {
  value = "${azurerm_resource_group.aks-rg.name}"
}
