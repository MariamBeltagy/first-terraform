data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_app_service_plan" "this" {
    name                = var.app_service_plan_name
    resource_group_name = data.azurerm_resource_group.this.name
    location            = var.resource_group_location != null ? var.resource_group_location : data.azurerm_resource_group.this.location
    sku {
        tier = var.tier
        size = var.size
    }
}

resource "azurerm_app_service" "this" {
    name                = var.app_service_name
    resource_group_name = data.azurerm_resource_group.this.name
    location            = var.resource_group_location != null ? var.resource_group_location : data.azurerm_resource_group.this.location
    app_service_plan_id = azurerm_app_service_plan.this.id
    depends_on          =[azurerm_app_service_plan.this]
}

resource "azurerm_app_service_slot" "this" {
    name                = var.app_Service_slot_name
    resource_group_name = data.azurerm_resource_group.this.name
    location            = var.resource_group_location != null ? var.resource_group_location : data.azurerm_resource_group.this.location
    app_service_plan_id = azurerm_app_service_plan.this.id
    app_service_name    = azurerm_app_service.this.name
    depends_on          =[azurerm_app_service.this]
}