output "storage_account_id" {
  value       = azurerm_storage_account.storage.id
  description = "ID of the Storage Account"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "Name of the Storage Account"
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.storage.primary_blob_endpoint
  description = "Primary Blob endpoint for the Storage Account"
}

output "container_names" {
  value       = azurerm_storage_container.containers[*].name
  description = "Names of the Storage Account containers"
}

output "name" {
  value       = azurerm_storage_account.storage.name
  description = "Name of the storage account"
}
