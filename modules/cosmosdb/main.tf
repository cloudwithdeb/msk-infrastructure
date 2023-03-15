
resource "azurerm_resource_group" "cosmosdb-mongodb-api-resource-group" {
  name     = var.resource-group
  location = var.location
  tags     = var.tags
}

resource "azurerm_cosmosdb_account" "cosmosdb-mongodb-api-account" {
  location            = azurerm_resource_group.cosmosdb-mongodb-api-resource-group.location
  resource_group_name = azurerm_resource_group.cosmosdb-mongodb-api-resource-group.name
  name                = var.database-name
  offer_type          = "Standard"
  kind                = "MongoDB"

  enable_automatic_failover = true
  tags = var.tags

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  capabilities {
    name = "EnableServerless"
  }

  consistency_policy {
    consistency_level       = "Strong"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

}
