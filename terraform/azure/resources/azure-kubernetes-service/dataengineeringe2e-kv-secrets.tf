data "azurerm_key_vault_secret" "aks_sp_password" {
  name         = "aks-sp-password"
  key_vault_id = var.vault_id
}

data "azurerm_key_vault_secret" "aks_sp_application_id" {
  name         = "aks-sp-application-id"
  key_vault_id = var.vault_id
}

data "azurerm_key_vault_secret" "aks_sp_object_id" {
  name         = "aks-sp-object-id"
  key_vault_id = var.vault_id
}

data "azurerm_key_vault_secret" "subscription_id" {
  name         = "subscription-id"
  key_vault_id = var.vault_id
}
