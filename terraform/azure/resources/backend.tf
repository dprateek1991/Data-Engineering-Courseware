terraform {

  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "dataengineeringe2e"
    storage_account_name = "dataengineeringe2e"
    container_name       = "tfstate"
    key                  = "state.tfstate"
  }
}