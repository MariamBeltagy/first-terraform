terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "tf_test" {
  name     = "rg1"
  location = "centralus"
}
module "blob_st" {
  source                  = "./modules/blob_storage"
  resource_group_location = azurerm_resource_group.tf_test.location
  resource_group_name     = azurerm_resource_group.tf_test.name
  storage_account_name    = "uniqename123123"
  storage_blob_name       = "blob1_test"
  storage_container_name  = "container1test"
  blob_source             = "testfile"
  depends_on              = [azurerm_resource_group.tf_test]
}

module "app_service" {
  source                  = "./modules/app_service"
  resource_group_name     = azurerm_resource_group.tf_test.name
  app_service_plan_name   = "appservicepaln1"
  app_service_name        = "appservice1"
  app_Service_slot_name   = "slottest1"
  depends_on              = [azurerm_resource_group.tf_test]
}
 #swap between prod and staging slot
resource "azurerm_app_service_active_slot" "slotDemoActiveSlot" {
    resource_group_name   = azurerm_resource_group.tf_test.name
    app_service_name      = module.app_service.app_service_name
    app_service_slot_name = module.app_service.app_service_slot_name
    depends_on            = [module.app_service]
}

# module "vnet" {
#   source              = "Azure/vnet/azurerm"
#   resource_group_name = azurerm_resource_group.tf_test.name
#   address_space       = ["10.0.0.0/16"]
#   subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   subnet_names        = ["subnet1", "subnet2", "subnet3"]

#   subnet_service_endpoints = {
#     subnet2 = ["Microsoft.Storage", "Microsoft.Sql"],
#     subnet3 = ["Microsoft.AzureActiveDirectory"]
#   }

#   tags = {
#     environment = "dev"
#     costcenter  = "it"
#   }

#   depends_on = [azurerm_resource_group.tf_test]
# }
