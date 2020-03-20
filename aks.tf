data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
  version_prefix = var.k8sversion
}

resource "azurerm_kubernetes_cluster" "ngx-aks" {
  name                = "${var.prefix}-${var.clustername}"
  location            = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = "${var.prefix}-${var.clustername}"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version

  default_node_pool {
    name            = "default"
    type            = "VirtualMachineScaleSets"
    node_count      = 2
    vm_size         = "Standard_A2_v2"
    os_disk_size_gb = 30
    max_pods        = 50
  }
  service_principal {
    client_id     = data.azuread_service_principal.aks-tf-sp.application_id
    client_secret = var.password
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    load_balancer_sku = "Standard"
    load_balancer_profile {
      managed_outbound_ip_count = 3
      }
   }

  linux_profile {
    admin_username = var.linuxuser
    ssh_key {
      key_data = file(var.mysshkey)
    }
  }
  depends_on = [
    azurerm_resource_group.aks-rg
  ]
}
