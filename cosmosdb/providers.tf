
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-global-configurations"
    storage_account_name = "dspglobalconfigurations"
    container_name       = "cosmosdb"
    key                  = "dev.tfstate"
  }
}