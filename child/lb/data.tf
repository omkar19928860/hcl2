data "azurerm_public_ip" "pip1" {
  name                = var.lb_pip
  resource_group_name = var.resource_group
}

data "azurerm_lb" "lb1" {
  name                = var.lb_name
  resource_group_name = var.resource_group
}
