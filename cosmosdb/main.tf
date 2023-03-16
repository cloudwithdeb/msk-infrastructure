
module "cosmosdb-mongodb-api" {
  source         = "../modules/cosmosdb"
  resource-group = var.resource-group
  database-name  = var.database-name
  subscription   = var.subscription
  location       = var.location
}
