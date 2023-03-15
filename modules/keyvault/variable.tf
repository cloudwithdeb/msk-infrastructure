
variable "location" {
  type = string
}

variable "subscription" {
  type = string
}

variable "resource-group" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "key-vault-config" {
  type = object({
    NAME                       = string
    SKU_NAME                   = string
    ENABLE_DISK_ENCRYPTION     = bool
    PURGE_PROTECTION_ENABLE    = bool
    SOFT_DELETE_RETENTION_DAYS = number
  })
}

variable "keyvault-secrets" {
  type = object({
    arksels-apigateway-key                = string
    arksels-sms-url                       = string
    senders-email-passwords               = string
    senders-email-address                 = string
    db-connection-string                  = string
    apigateway-backend-use-internally-key = string
    jwt-secret-key                        = string
    apigateway-url                        = string
  })
}
