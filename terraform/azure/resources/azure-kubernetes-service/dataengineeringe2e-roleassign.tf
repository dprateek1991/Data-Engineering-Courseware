resource "azurerm_role_definition" "dataengineeringe2e_aks_role_definition" {
  name               = "dataengineeringe2e-aks-role-definition"
  scope              = "/subscriptions/${data.azurerm_key_vault_secret.subscription_id.value}"
  permissions {
    actions     = [
      "Microsoft.Compute/disks/delete",
      "Microsoft.Compute/disks/read",
      "Microsoft.Compute/disks/write",
      "Microsoft.Compute/virtualMachineScaleSets/manualUpgrade/action",
      "Microsoft.Compute/virtualMachineScaleSets/read",
      "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/networkInterfaces/read",
      "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/read",
      "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/write",
      "Microsoft.Compute/virtualMachineScaleSets/write",
      "Microsoft.Compute/virtualMachines/read",
      "Microsoft.Compute/virtualMachines/write",
      "Microsoft.Network/loadBalancers/write",
      "Microsoft.Network/loadBalancers/backendAddressPools/join/action",
      "Microsoft.Network/loadBalancers/delete",
      "Microsoft.Network/loadBalancers/read",
      "Microsoft.Network/networkInterfaces/join/action",
      "Microsoft.Network/networkInterfaces/read",
      "Microsoft.Network/networkInterfaces/write",
      "Microsoft.Network/networkSecurityGroups/read",
      "Microsoft.Network/networkSecurityGroups/write",
      "Microsoft.Network/publicIPAddresses/delete",
      "Microsoft.Network/publicIPAddresses/join/action",
      "Microsoft.Network/publicIPAddresses/read",
      "Microsoft.Network/publicIPAddresses/write",
      "Microsoft.Network/routeTables/read",
      "Microsoft.Network/routeTables/routes/delete",
      "Microsoft.Network/routeTables/routes/write",
      "Microsoft.Network/routeTables/write",
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/read",
      "Microsoft.Storage/storageAccounts/listKeys/action",
      "Microsoft.Storage/storageAccounts/read",
      "Microsoft.Storage/storageAccounts/write",
      "Microsoft.ContainerRegistry/registries/pull/read",
      "Microsoft.ContainerRegistry/registries/push/write",
      "Microsoft.ManagedIdentity/userAssignedIdentities/*/assign/action"
    ]
    not_actions = []
  }
  assignable_scopes = [
    "/subscriptions/${data.azurerm_key_vault_secret.subscription_id.value}"
  ]
}

resource "azurerm_role_assignment" "dataengineeringe2e_aks_role_assignment" {
  scope              = "/subscriptions/${data.azurerm_key_vault_secret.subscription_id.value}"
  role_definition_id = azurerm_role_definition.dataengineeringe2e_aks_role_definition.id
  principal_id       = data.azurerm_key_vault_secret.aks_sp_object_id.value
}
