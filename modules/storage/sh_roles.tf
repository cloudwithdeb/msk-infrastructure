
# Mystorekeeper Shop Data Roles with ID

resource "azurerm_storage_table_entity" "msk-organization-Shop-data-data-admin-roles" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 4000
  entity = {
    role = "Shop Data Admin"
    description = "Allow User To Add Products To Shop, Update Product In Shop And Delete Product From Shop"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-Shop-data-add-products-to-Shop-roles" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 4001
  entity = {
    role = "Add Products To Shop"
    description = "Allow User To Add Products To Shop"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-Shop-data-delete-products-from-Shop-roles" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 4002
  entity = {
    role = "Delete Products From Shop"
    description = "Allow User To Delete Products From Shop"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-Shop-data-update-products-in-Shop-roles" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 4003
  entity = {
    role = "Update Products In Shop"
    description = "Allow User To Update Products In Shop"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}


# Mystorekeeper Shop Roles with ID


resource "azurerm_storage_table_entity" "msk-organization-Shop-admin" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 4004
  entity = {
    role = "Shop Admin"
    description = "Allow User To Create New Shop, Update Shop And Delete Shop"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-Shop-create-new-Shop" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 4005
  entity = {
    role = "Create New Shop"
    description = "Allow User To Create New Shop"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-Shop-update-Shop" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 4006
  entity = {
    role = "Update Shop"
    description = "Allow User To Update Shop"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

resource "azurerm_storage_table_entity" "msk-organization-Shop-delete-Shop" {
  storage_account_name = azurerm_storage_account.storage-account.name
  table_name           = var.list-of-storage-account-table-names[0]

  partition_key = var.organization-role-ids["shop"]
  row_key       = 4007
  entity = {
    role = "Delete Shop"
    description = "Allow User To Delete Shop"
  }
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}