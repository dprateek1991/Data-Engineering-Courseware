resource "azurerm_template_deployment" "aml_workspace" {
  name                = var.workspace_name
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  template_body       = <<DEPLOY
        ${file("${path.module}/aml_workspace.json")}
    DEPLOY
  parameters_body     = jsonencode(local.parameters_body)
}

locals {
  parameters_body = {
    resourceTags = {
      value = {
        "Team" = var.team
      }
    }
    workspaceName = {
      value = var.workspace_name
    }
    applicationInsightsName = {
      value = var.applicationInsightsName
    }
    keyVaultName = {
      value = var.keyVaultName
    }
    storageAccountName = {
      value = var.storageAccountName
    }
    containerRegistryName = {
      value = var.containerRegistryName
    }
    keyVaultURI = {
      value = var.keyVaultURI
    }
  }
}
