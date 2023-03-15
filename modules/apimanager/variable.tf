
variable "location" {
  type = string
}

variable "subscription" {
  type = string
}

variable "resource-group" {
  type = string
}

variable "apigateway-log-analytics" {
  type = object({
    ANALYTICS_WORKSPACE_NAME = string
    ANALYTICS_SKU            = string
    RETENTION_DAYS           = number
  })
}

variable "apigateway-application-insight" {
  type = object({
    NAME             = string
    APPLICATION_TYPE = string
  })
}

variable "apigateway-management" {
  type = object({
    NAME            = string
    PUBLISHER_NAME  = string
    PUBLISHER_EMAIL = string
    SKU_NAME        = string
    LOGER_NAME      = string
  })
}

variable "tags" {
  type = map(string)
}
