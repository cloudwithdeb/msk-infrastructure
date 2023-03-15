
resource "azurerm_resource_group" "api-management-resource-group" {
  name     = var.resource-group
  location = var.location
  tags     = var.tags
}

resource "azurerm_log_analytics_workspace" "msk-stage-apigateway-app-insight-log-workspace" {
  name                = var.apigateway-log-analytics["ANALYTICS_WORKSPACE_NAME"]
  location            = azurerm_resource_group.api-management-resource-group.location
  resource_group_name = azurerm_resource_group.api-management-resource-group.name
  sku                 = var.apigateway-log-analytics["ANALYTICS_SKU"]
  retention_in_days   = var.apigateway-log-analytics["RETENTION_DAYS"]
  tags                = var.tags
}

resource "azurerm_application_insights" "apigateway-insight" {
  name                = var.apigateway-application-insight["NAME"]
  location            = azurerm_resource_group.api-management-resource-group.location
  resource_group_name = azurerm_resource_group.api-management-resource-group.name
  workspace_id        = azurerm_log_analytics_workspace.msk-stage-apigateway-app-insight-log-workspace.id
  application_type    = var.apigateway-application-insight["APPLICATION_TYPE"]
  tags                = var.tags

}

resource "azurerm_api_management" "msk-stage-apigateway" {
  name                = var.apigateway-management["NAME"]
  location            = azurerm_resource_group.api-management-resource-group.location
  resource_group_name = azurerm_resource_group.api-management-resource-group.name
  publisher_name      = var.apigateway-management["PUBLISHER_NAME"]
  publisher_email     = var.apigateway-management["PUBLISHER_EMAIL"]
  sku_name            = var.apigateway-management["SKU_NAME"]
  tags                = var.tags
}

resource "azurerm_api_management_logger" "api-logger" {
  name                = var.apigateway-management["LOGER_NAME"]
  api_management_name = azurerm_api_management.msk-stage-apigateway.name
  resource_group_name = azurerm_resource_group.api-management-resource-group.name

  application_insights {
    instrumentation_key = azurerm_application_insights.apigateway-insight.instrumentation_key
  }

}
