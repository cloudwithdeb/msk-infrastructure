resource "azurerm_resource_group" "storage-account-resource-group" {
  name     = var.resource-group
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "storage-account" {
  name                      = var.storage-account-name
  resource_group_name       = azurerm_resource_group.storage-account-resource-group.name
  location                  = azurerm_resource_group.storage-account-resource-group.location
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "ZRS"
  enable_https_traffic_only = true
  allow_blob_public_access  = true
  blob_properties {
    cors_rule {
      allowed_origins    = ["*"]
      allowed_methods    = ["DELETE", "GET", "HEAD", "POST", "OPTIONS", "PUT"]
      allowed_headers    = ["DELETE", "GET", "HEAD", "POST", "OPTIONS", "PUT"]
      exposed_headers    = ["*"]
      max_age_in_seconds = 30
    }
    versioning_enabled = true
  }
  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }
  tags = var.tags
}

# Storage Container

resource "azurerm_storage_container" "storage-account-container" {
  for_each              = toset(var.list-of-storage-account-container-names)
  name                  = each.key
  storage_account_name  = azurerm_storage_account.storage-account.name
  container_access_type = "blob"
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

# Storage Table

resource "azurerm_storage_table" "storage-account-table" {
  for_each             = toset(var.list-of-storage-account-table-names)
  name                 = each.key
  storage_account_name = azurerm_storage_account.storage-account.name
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}


# Storage Queue

resource "azurerm_storage_queue" "storage-account-queue" {
  for_each = toset(var.list-of-storage-account-queue-names)
  name                 = each.key
  storage_account_name = azurerm_storage_account.storage-account.name
  depends_on = [
    azurerm_storage_account.storage-account
  ]
}

# Role Assignment

resource "azurerm_role_assignment" "assign-storage-table-contributor-role" {
  scope                = azurerm_storage_account.storage-account.id
  role_definition_name = "Storage Table Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "assign-storage-blob-data-contributor-role" {
  scope                = azurerm_storage_account.storage-account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "assign-storage-queue-data-contributor-role" {
  scope                = azurerm_storage_account.storage-account.id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}