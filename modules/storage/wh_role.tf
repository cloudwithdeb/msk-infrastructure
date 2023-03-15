
# Mystorekeeper Warehouse Data Roles with ID

resource "azurerm_storage_table_entity" "msk-organization-warehouse-data-data-admin-roles" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["warehouse"]
  row_key       = 1000
  entity = {
    role = "Warehouse Data Admin"
    description = "Allow User To Add Product To Warehouse, Delete Product From Warehouse and Update Products In Warehouse"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-warehouse-data-add-products-to-warehouse-roles" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["warehouse"]
  row_key       = 1001
  entity = {
    role = "Add Products To Warehouse"
    description = "Allow User To Add Product To Warehouse"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-warehouse-data-delete-products-from-warehouse-roles" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["warehouse"]
  row_key       = 1002
  entity = {
    role = "Delete Products From Warehouse"
    description = "Allow User To Delete Products From Warehouse"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-warehouse-data-update-products-in-warehouse-roles" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["warehouse"]
  row_key       = 1003
  entity = {
    role = "Update Products In Warehouse"
    description = "Allow User To Update Products In Warehouse"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}


# Mystorekeeper Warehouse Roles with ID


resource "azurerm_storage_table_entity" "msk-organization-warehouse-admin" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["warehouse"]
  row_key       = 1004
  entity = {
    role = "Warehouse Admin"
    description = "Allow User To Create New Warehouse, Update Warehouse And Delete Warehouse"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-warehouse-create-new-warehouse" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["warehouse"]
  row_key       = 1005
  entity = {
    role = "Create New Warehouse"
    description = "Allow User To Create A New Warehouse"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-warehouse-update-warehouse" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["warehouse"]
  row_key       = 1006
  entity = {
    role = "Update Warehouse"
    description = "Allow User To Update Warehouse"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-warehouse-delete-warehouse" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["warehouse"]
  row_key       = 1007
  entity = {
    role = "Delete Warehouse"
    description = "Allow User Delete Warehouse"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}