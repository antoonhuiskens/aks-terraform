# Resource Group creation
resource "azurerm_resource_group" "aks-rg" {
  name = "${var.prefix}-${var.rg-name}"
  location = var.location
}
