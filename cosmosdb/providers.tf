
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "msk-configurations"
    storage_account_name = "configurations10"
    container_name       = "cosmosdb"
    key                  = "dev.tfstate"
  }
}