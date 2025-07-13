resource "azurerm_resource_group" "rg-conditional" {
  location = var.rg_location
  name     = "${var.rg_name}${var.env}"
}

resource "azurerm_storage_account" "my_storage_account" {
  count = var.add_storage_account ? 1 : 0

  resource_group_name      = azurerm_resource_group.rg-conditional.name
  location                 = azurerm_resource_group.rg-conditional.location
  account_tier             = var.env == "dev" || var.env == "sbx" ? "Standard" : "Premium"
  account_replication_type = "LRS"
  name = "storage${var.env}${count.index}"
}

output "storage_account_name" {
  value = length(azurerm_storage_account.my_storage_account) > 0 ? azurerm_storage_account.my_storage_account[0].name : "Resource not created"
}
