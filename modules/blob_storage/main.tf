data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = var.resource_group_location != null ? var.resource_group_location : data.azurerm_resource_group.this.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "this" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "this" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = azurerm_storage_container.this.name
  type                   = var.blob_type
  source                 = var.blob_source
}