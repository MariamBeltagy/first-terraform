output "storage_account_properties" {
  description = "Created Storage Account properties"
  value       = azurerm_storage_account.this
}

output "storage_account_id" {
  description = "Created storage account ID"
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "Created storage account name"
  value       = azurerm_storage_account.this.name
}

output "storage_account_identity" {
  description = "Created Storage Account identity block"
  value       = azurerm_storage_account.this.identity
}

output "storage_blob_containers" {
  description = "Created blob containers in the Storage Account"
  value       = azurerm_storage_container.this
}

output "storage_blob" {
  description = "Created file shares in the Storage Account"
  value       = azurerm_storage_blob.this
}
