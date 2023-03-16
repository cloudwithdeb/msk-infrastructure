#Deploy cosmosdb database
module "cosmosdb-mongodb-api" {
  source         = "../modules/cosmosdb"
  tags           = merge(var.tags, { env = var.env })
  resource-group = "rg-${var.env}-cosmosdb"
  database-name  = var.database-name
  subscription   = var.subscription
  location       = var.location
}
