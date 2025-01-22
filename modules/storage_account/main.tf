resource "azurerm_storage_account" "storage" {
  name                     = var.account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  allow_blob_public_access = var.allow_blob_public_access
  enable_https_traffic_only = var.enable_https_traffic_only

  tags = var.tags
}

resource "azurerm_storage_container" "containers" {
  count                  = length(var.container_names)
  name                   = var.container_names[count.index]
  storage_account_name   = azurerm_storage_account.storage.name
  container_access_type  = var.container_access_type
}

output "storage_account_id" {
  value       = azurerm_storage_account.storage.id
  description = "ID of the Storage Account"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "Name of the Storage Account"
}

output "container_names" {
  value       = azurerm_storage_container.containers[*].name
  description = "Names of the Storage Account containers"
}
