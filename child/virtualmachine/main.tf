resource "azurerm_linux_virtual_machine" "frontend" {
  name                = var.vm_namef
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "admin@123456"
  disable_password_authentication = "false"
  network_interface_ids = [
    azurerm_network_interface.nic_namef.id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
resource "azurerm_network_interface" "nic_namef" {
  name                = var.nic_namef
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.nicf.id
    private_ip_address_allocation = "Dynamic"
  }
}



resource "azurerm_linux_virtual_machine" "backend" {
  name                = var.vm_nameb
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
 admin_password      = "admin@123456"
  disable_password_authentication = "false"
  network_interface_ids = [
    azurerm_network_interface.nic_nameb.id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


resource "azurerm_network_interface" "nic_nameb" {
  name                = var.nic_nameb
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.nicb.id
    private_ip_address_allocation = "Dynamic"
  }
}