data "azurerm_subscription" "current" {}

data "azuread_application" "aks-tf-app" {
  name = "ah-aks-tf"
}

data "azuread_service_principal" "aks-tf-sp" {
  display_name = "ah-aks-tf"
}

