variable "resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "resource_group_location" {
  type        = string
  description = "resource group location"
}

variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "account tier"
}
variable "account_replication_type" {
  type        = string
  default     = "LRS"
  description = "account replication type"
}
variable "storage_account_name" {
  type        = string
  description = "storage account name"
}
variable "storage_container_name" {
  type        = string
  description = "storage container name"
}
variable "container_access_type" {
  type        = string
  default     = "private"
  description = "container access type"
}
variable "storage_blob_name" {
  type        = string
  description = "storage blob name"
}
variable "blob_type" {
  type        = string
  default     = "Block"
  description = "blob type"
}
variable "blob_source" {
  type        = string
  description = "blob source"
}