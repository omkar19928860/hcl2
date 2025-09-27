data "azurerm_subnet" "nicf" {
  name                 = var.subnetfront_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group
}

data "azurerm_subnet" "nicb" {
  name                 = var.subnetbackend_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group
}