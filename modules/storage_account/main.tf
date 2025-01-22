resource "azurerm_storage_account" "storage" {
  name                     = var.account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
}


resource "azurerm_storage_container" "containers" {
  count                  = length(var.container_names)
  name                   = var.container_names[count.index]
  storage_account_id = azurerm_storage_account.storage.id
  container_access_type  = var.container_access_type
}
