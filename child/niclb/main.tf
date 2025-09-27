resource "azurerm_network_interface" "nic1" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}



  


