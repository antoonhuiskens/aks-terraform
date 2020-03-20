# Resource Group creation
resource "azurerm_resource_group" "aks-rg" {
  name = var.rg-name
  location = var.location
}
