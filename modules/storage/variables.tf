
variable "location" {
  type = string
}

variable "subscription" {
  type = string
}

variable "resource-group" {
  type = string
}

variable "storage-account-name" {
  type = string
}

variable "list-of-storage-account-container-names" {
  type = list(string)
}

variable "list-of-storage-account-table-names" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "organization-role-ids" {
  type = object({
    warehouse = string
    higher = string
    shop = string
  })
}

variable "list-of-storage-account-queue-names" {
  type = list(string)
}
