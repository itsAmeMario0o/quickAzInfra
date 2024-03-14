# Create a resource group
resource "azurerm_resource_group" "DevSec" {
  name     = "DevSec-RG"
  location = "East US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "DevSec" {
  name                = "DevSec-VNET"
  resource_group_name = azurerm_resource_group.DevSec.name
  location            = azurerm_resource_group.DevSec.location
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_subnet" "SUBNET1" {
  name                 = "SUBNET1"
  resource_group_name  = azurerm_resource_group.DevSec.name
  virtual_network_name = azurerm_virtual_network.DevSec.name
  address_prefixes     = ["192.168.1.0/24"]
}

resource "azurerm_subnet" "SUBNET2" {
  name                 = "SUBNET2"
  resource_group_name  = azurerm_resource_group.DevSec.name
  virtual_network_name = azurerm_virtual_network.DevSec.name
  address_prefixes     = ["192.168.2.0/24"]
}