variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "add_storage_account" {
  description = "boolean to determine whether to create a storage account or not"
  type        = bool
}

variable "rg_location" {
  type = string
  default = "East US"
}

variable "rg_name" {
  type = string
  default = "rg-"
  description = "Resource Group name will be rg-<environment>"
}
variable "env" {
  type = string
}