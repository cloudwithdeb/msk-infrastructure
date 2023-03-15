
module "cosmosdb-mongodb-api" {
  source         = "../modules/cosmosdb"
  tags           = merge(var.tags, {env = var.env})
  resource-group = "msk-${var.env}-cosmosdb"
  database-name  = "msk-${var.env}"
  subscription   = var.subscription
  location       = var.location
}
