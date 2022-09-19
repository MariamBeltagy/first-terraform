output "azurerm_app_service_plan_id" {
  description = "Created app service plan ID"
  value       = azurerm_app_service_plan.this.id
}

output "app_service_name" {
  description = "Created app service name"
  value       = azurerm_app_service.this.name
}

output "app_service_slot_name" {
  value       = azurerm_app_service_slot.this.name
  description = "app service slot name"
}

