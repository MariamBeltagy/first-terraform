terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.92.0"
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
module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.tf_test.name
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  subnet_service_endpoints = {
    subnet2 = ["Microsoft.Storage", "Microsoft.Sql"],
    subnet3 = ["Microsoft.AzureActiveDirectory"]
  }

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.tf_test]
}

# resource "azurerm_container_group" "cg_test" {
#   name                = "cg1"
#   location            = azurerm_resource_group.tf_test.location
#   resource_group_name = azurerm_resource_group.tf_test.name
#   ip_address_type     = "Public"
#   dns_name_label      = "dns-label"
#   os_type             = "Linux"
#   container {
#     name   = "hello-world"
#     image  = "/home/mariam/Desktop/terraform/first-terraform"
#     cpu    = "0.5"
#     memory = "1.5"

#     ports {
#       port     = 443
#       protocol = "TCP"
#     }
#   }
#   tags = {
#     environment = "testing"
#   }
# }