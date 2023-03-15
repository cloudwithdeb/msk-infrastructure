
variable "location" {
  type = string
}

variable "resource-group" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "application-insight-name" {
  type = string
}

variable "application-insight-type" {
  type = string
}


variable "function-storage-account" {
  type = string
}

variable "service-plan-name" {
  type = string
}

variable "function-app-name" {
  type = string
}

variable "keyvault-url" {
  type = string
}

variable "storage-account-name" {
  type = string
}

variable "keyvault-resource-group-and-name" {
  type = object({
    name           = string
    resource-group = string
  })
}

variable "env" {
  type = string
}