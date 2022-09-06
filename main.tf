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
resource "azurerm_resource_group" "tf_test2" {
  name     = "rg2"
  location = "centralus"
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