# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  
}



resource "azurerm_resource_group" "class" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_virtual_network" "vnetclass" {
  name= var.virtualnet_name
  address_space = ["10.0.0.0/16"]
  resource_group_name = var.rgname
  location = var.location
  depends_on = [ azurerm_resource_group.class ]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = var.rgname
  virtual_network_name = var.virtualnet_name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [azurerm_virtual_network.vnetclass]
}

