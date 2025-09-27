resource "azurerm_bastion_host" "azurerm_bastion" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                 = "internal"
    subnet_id            = data.azurerm_subnet.nic_nameb.id
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}