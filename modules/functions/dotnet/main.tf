
resource "azurerm_resource_group" "add-employees-resource-group" {
  name     = var.resource-group
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "add-employees-storage-account" {
  name                     = var.function-storage-account
  resource_group_name      = azurerm_resource_group.add-employees-resource-group.name
  location                 = azurerm_resource_group.add-employees-resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_app_service_plan" "az-msk-function-service-plan" {
  name                = var.service-plan-name
  location            = azurerm_resource_group.add-employees-resource-group.location
  resource_group_name = azurerm_resource_group.add-employees-resource-group.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }

  lifecycle {
    ignore_changes = [
      kind
    ]
  }
  tags = var.tags
}

resource "azurerm_application_insights" "application-insight" {
  name                = var.application-insight-name
  location            = azurerm_resource_group.add-employees-resource-group.location
  resource_group_name = azurerm_resource_group.add-employees-resource-group.name
  application_type    = var.application-insight-type
  tags                = var.tags
}

resource "azurerm_function_app" "function-app" {
  name                       = var.function-app-name
  location                   = azurerm_resource_group.add-employees-resource-group.location
  resource_group_name        = azurerm_resource_group.add-employees-resource-group.name
  app_service_plan_id        = azurerm_app_service_plan.az-msk-function-service-plan.id
  storage_account_name       = azurerm_storage_account.add-employees-storage-account.name
  storage_account_access_key = azurerm_storage_account.add-employees-storage-account.primary_access_key
  os_type                    = "linux"
  version                    = "~4"

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME          = "dotnet-isolated"
    APPINSIGHTS_INSTRUMENTATIONKEY    = azurerm_application_insights.application-insight.instrumentation_key
    KEY_VAULT_URL                     = var.keyvault-url
    REGISTERED_USERS_ROLE_BRANCH_DETAILS="registeredUsersRoleBranchDetails"
    REGISTERED_USERS_PRODUCTS_METADATA="registeredUsersProductsMetadata"
    REGISTERED_USERS_LOGIN_DETAILS="registeredUsersLoginDetails"
    REGISTERED_USERS_SUBSCRIPTIONS="registeredUsersSubscriptions"
    REGISTERED_USERS_EMPLOYEES="registeredUsersEmployees"
    REGISTERED_USERS_WAREHOUSE="registeredUsersWarehouse"
    REGISTERED_USERS_SHOP="registeredUsersShop"
    REGISTERED_USERS_OTP="egisteredUsersOtp"
    STORAGE_ACCOUNT_NAME="mskwebapp${var.env}"
    CLIENT_DETAILS="clientDetails"
    SIGNUP_STORAGE_QUEUE="signup"
    NOTIFICATION="notification"
    CLIENT_ROLES="clientRoles"
    ADD_EMPLOYEES="add-employees"
    ADD_GUEST_USERS="add-guest-users"
    ADD_PERMANENT_USERS="add-permanent-users"
    DELETE_EMPLOYEES="delete-employees"
    DELETE_GUEST_USERS="delete-guest-users"
    DELETE_PERMANENT_USERS="delete-permanent-users"
    UPDATE_EMPLOYEES="update-employees"
    UPDATE_GUEST_USERS="update-guest-users"
    UPDATE_PERMANENT_USERS="update-permanent-users"
    ADD_WAREHOUSE="add-warehouse-products"
    ADD_SHOP="add-shop-products"
    DELETE_WAREHOUSE="delete-warehouse-products"
    DELETE_SHOP="delete-shop-products"
    UPDATE_WAREHOUSE="update-warehouses"
    UPDATE_SHOP="update-shop-products"
    ADD_WAREHOUSE_METADATA="add-warehouse-metadata"
    ADD_SHOP_METADATA="add-shop-metadata"
    DELETE_WAREHOUSE_METADATA="delete-warehouse-metadata"
    DELETE_SHOP_METADATA="delete-shop-metadata" 
    UPDATE_WAREHOUSE_METADATA="update-warehouses-metadata"
    UPDATE_SHOP_METADATA="update-shop-metadata"
    SMS_NOTIFICATIONS="sms-notifications"
    EMAIL_NOTIFICATIONS="email-notifications"
    MyConnection : ""
    MyConnection__queueServiceUri = "https://mskwebapp${var.env}.queue.core.windows.net"
  }

  site_config {
    dotnet_framework_version = "v6.0"
    linux_fx_version         = "DOTNET-ISOLATED|6.0"
    always_on                = false
    cors {
      allowed_origins = ["*"]
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "Assign-keyvault-polices-to-function-app" {
  key_vault_id = data.azurerm_key_vault.msk-keyvault.id
  tenant_id    = azurerm_function_app.function-app.identity[0].tenant_id
  object_id    = azurerm_function_app.function-app.identity[0].principal_id

  key_permissions = [
    "Create",
    "Get",
  ]

  secret_permissions = [
    "Get",
    "Set",
    "List",
    "Purge"
  ]
}
