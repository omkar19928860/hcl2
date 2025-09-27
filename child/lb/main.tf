resource "azurerm_lb" "example" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group
    sku                 = "Standard"

  frontend_ip_configuration {
    name                 = var.lb_frontend_ip_name
    public_ip_address_id = data.azurerm_public_ip.pip1.id
  }
}

resource "azurerm_lb_backend_address_pool" "example" {
  loadbalancer_id = data.azurerm_lb.lb1.id
  name            = var.azurerm_lb_backend_address_pool
}


  resource "azurerm_lb_probe" "probe1" {
  loadbalancer_id = data.azurerm_lb.lb1.id
  name            = var.probe
  port            = 22
}

resource "azurerm_lb_rule" "lbrule1" {
  loadbalancer_id                = data.azurerm_lb.lb1.id
  name                           = var.rule_name
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = azurerm_lb.example.frontend_ip_configuration[0].name
}