resource "azurerm_public_ip" "pip1" {
  name                = var.lb_pip
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
  sku                 = "Standard"
}