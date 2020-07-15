resource "azurerm_key_vault_access_policy" "key-vault-admin-access" {
  
  for_each    = toset(var.admin_users)
  
  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = var.tenant_id
  object_id = each.key

  key_permissions = [
    "backup", "create", "decrypt", "delete", "encrypt", "get", "import", 
    "list", "purge", "recover", "restore", 
    "sign", "unwrapKey", "update", "verify", "wrapKey"
  ]

  secret_permissions = [
    "backup", "delete", "get", "list", "purge", "recover", "restore", "set"
  ]

  certificate_permissions = [
    "backup", "create", "delete", "deleteissuers", "get", "getissuers", 
    "import", "list", "listissuers", "managecontacts", "manageissuers", 
    "purge", "recover", "restore", "setissuers", "update"
  ]

  storage_permissions = [
    "backup", "delete", "deletesas", "get", "getsas", "list", 
    "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"
  ]
}
