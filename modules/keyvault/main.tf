
resource "azurerm_resource_group" "msk-keyvault" {
  name     = var.resource-group
  location = var.location
  tags     = var.tags
}

resource "azurerm_key_vault" "mystorekeeper-keyvault" {
  name                        = var.key-vault-config["NAME"]
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  location                    = azurerm_resource_group.msk-keyvault.location
  resource_group_name         = azurerm_resource_group.msk-keyvault.name
  soft_delete_retention_days  = var.key-vault-config["SOFT_DELETE_RETENTION_DAYS"]
  purge_protection_enabled    = var.key-vault-config["PURGE_PROTECTION_ENABLE"]
  enabled_for_disk_encryption = var.key-vault-config["ENABLE_DISK_ENCRYPTION"]
  sku_name                    = var.key-vault-config["SKU_NAME"]

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
      "Delete",
      "List",
      "Update"
    ]

    secret_permissions = [
      "Get",
      "Set",
      "List",
      "Purge",
      "Delete"
    ]

  }

  tags = var.tags
}

resource "azurerm_key_vault_secret" "secret-values" {
  for_each     = var.keyvault-secrets
  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.mystorekeeper-keyvault.id
  depends_on = [
    azurerm_key_vault.mystorekeeper-keyvault
  ]
}

