
data "azurerm_key_vault" "msk-keyvault" {
  name                = var.keyvault-resource-group-and-name["name"]
  resource_group_name = var.keyvault-resource-group-and-name["resource-group"]
}

