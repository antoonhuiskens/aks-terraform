data "azuread_application" "aks-tf-app" {
  name = "ah-aks-tf"
}

data "azuread_service_principal" "aks-tf-sp" {
  display_name = "ah-aks-tf"
}

resource "azuread_application_password" "aks_sp_pwd" {
  application_object_id = data.azuread_application.aks-tf-app.id
  value                 = var.password
  end_date_relative     = "8736h"
}

