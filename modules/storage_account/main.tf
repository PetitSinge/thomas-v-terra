resource "random_pet" "storage_account_name" {
  length    = 2
  separator = "-"
}


resource "azurerm_storage_account" "storage" {
  name = "${random_pet.storage_account_name.id}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  allow_nested_items_to_be_public = var.allow_blob_public_access
  https_traffic_only_enabled      = var.enable_https_traffic_only

  tags = var.tags
}


resource "azurerm_storage_container" "containers" {
  count                  = length(var.container_names)
  name                   = var.container_names[count.index]
  storage_account_id = azurerm_storage_account.storage.id
  container_access_type  = var.container_access_type
}

