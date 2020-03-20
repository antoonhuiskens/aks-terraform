resource "azurerm_lb" "aks-lb" {
  name                = var.lb-name
  location            = var.location
  resource_group_name = azurerm_resource_group.aks-rg.name
}
resource "azurerm_network_security_group" "aks-sg" {
  name                = var.aks-sg-name
  location            = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name

  security_rule {
    name                       = "httpinrule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "httpoutrule"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}
