resource "azurerm_subnet" "subnetfront" {
  name                 = var.subnetfront_name
  resource_group_name  = var.resource_group
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes1
}

resource "azurerm_subnet" "subnetbackend" {
  name                 = var.subnetbackend_name
  resource_group_name  = var.resource_group
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes2
}


resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes3
}



  


