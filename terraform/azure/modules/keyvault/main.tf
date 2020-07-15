resource "azurerm_key_vault" "key_vault" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = var.tenant_id

  sku_name = var.sku_name

  network_acls {
    default_action              = "Deny"
    bypass                      = var.bypass
    ip_rules                    = var.excluded_ips
  }

  tags = {
    Name           =  "${var.name}-kv"
  }
}
