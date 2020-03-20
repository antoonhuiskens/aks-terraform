# data.azuread_service_principal is needed both for aks and acr.

data "azuread_service_principal" "aks-tf-sp" {
  display_name = var.ad_app
}

# Specify the name of an existing AD application:
data "azuread_application" "aks-tf-app" {
  name = var.ad_app
}

# update the end_date for the SP.
resource "azuread_application_password" "aks_sp_pwd" {
  application_object_id = data.azuread_application.aks-tf-app.id
  value                 = var.password
  end_date_relative     = "8736h"
}

