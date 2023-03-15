
resource "azurerm_storage_table_entity" "msk-organization-high-level-role-owner" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["higher"]
  row_key       = 5000
  entity = {
    role = "Owner"
    description = "Allow User To Have Full Access To Organization"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-high-level-role-admin" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["higher"]
  row_key       = 2000
  entity = {
    role = "Admin"
    description = "Allow User To Have Full Access To Organization Except Managing Users (Creating And Deleting Of Admins)"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-high-level-role-viewer" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["higher"]
  row_key       = 3000
  entity = {
    role = "Viewer"
    description = "Allow User To See Eveything In Organization But Cannot Create, Update Or Delete A Resource"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}