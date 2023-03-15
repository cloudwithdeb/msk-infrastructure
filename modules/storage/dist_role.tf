
resource "azurerm_storage_table_entity" "msk-organization-distributer-admin" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 5001
  entity = {
    role = "Distributer Admin"
    description = "Allow User To Distribute Products From All Branches To All Other Branches"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-distributer-warehouse-to-warehouse" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 5002
  entity = {
    role = "Distribute Data From One Warehouse To Another Warehouse"
    description = "Allow User To Distribute Data From One Warehouse To Another Warehouse"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-distributer-warehouse-to-shop" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 5003
  entity = {
    role = "Distribute Data From Warehouse To Shop"
    description = "Allow User To Distribute Data From A Warehouse To A Shop"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-distributer-shop-to-shop" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 5004
  entity = {
    role = "Distribute Data From Shop To Shop"
    description = "Allow User To Distribute Data From One Shop To Another Shop"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-distributer-shop-to-warehouse" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 5005
  entity = {
    role = "Distribute Data From Shop To Warehouse"
    description = "Allow User To Distribute Data From One Shop To A Warehouse"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}