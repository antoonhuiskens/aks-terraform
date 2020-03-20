resource "azurerm_container_registry" "aks-acr" {
  # note that the name should not contain hyphens (and others).
  name                     = "${var.prefix}${var.acr-name}"
  resource_group_name      = azurerm_resource_group.aks-rg.name
  location                 = azurerm_resource_group.aks-rg.location
  sku                      = "Basic"
  admin_enabled            = true
}

data "azurerm_subscription" "current" {}

# Assign AcrPull role to service principal
resource "azurerm_role_assignment" "acrpull_role" {
  scope                            = "${data.azurerm_subscription.current.id}/resourceGroups/${var.prefix}-${var.rg-name}"
  role_definition_name             = "AcrPull"
  principal_id                     = data.azuread_service_principal.aks-tf-sp.id
  skip_service_principal_aad_check = true
  depends_on = [
    azurerm_resource_group.aks-rg
  ]
}
