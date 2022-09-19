variable "resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "resource_group_location" {
  type        = string
  description = "resource group location"
  default     = null
}

variable "app_service_plan_name" {
  type        = string
  description = "app service plan name"
}

variable "tier" {
  type        = string
  default     = "standard"
  description = "tier"
}

variable "size" {
  type        = string
  default     = "S1"
  description = "size"
}

variable "app_service_name" {
  type        = string
  description = "app service name"
}

variable "app_Service_slot_name" {
  type        = string
  description = "app service slot name"
}