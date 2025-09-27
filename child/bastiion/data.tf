data "azurerm_subnet" "nic_nameb" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group
}

data "azurerm_public_ip" "pip" {
  name                = var.public_ip
  resource_group_name = var.resource_group
}
