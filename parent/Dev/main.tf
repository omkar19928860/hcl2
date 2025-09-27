module "resource_group" {
  source         = "../../child/resourcegroup"
  resource_group = "hclrg1"
  location       = "Central India"
}


module "vnet" {
  source         = "../../child/vnet"
  vnet_name      = "hcl-vnet"
  resource_group = "hclrg1"
  location       = "Central India"
  address_space  = ["10.0.0.0/24"]
  depends_on     = [module.resource_group]
}

module "subnetfront" {
  source             = "../../child/subnet"
  resource_group     = "hclrg1"
  vnet_name          = "hcl-vnet"
  address_prefixes1  = ["10.0.0.0/26"]   # subnet-front
  address_prefixes2  = ["10.0.0.64/26"]  # subnet-back
  address_prefixes3  = ["10.0.0.128/27"] # AzureBastionSubnet
  subnetfront_name   = "subnet-front"
  subnetbackend_name = "subnet-back"
  subnet_name        = "AzureBastionSubnet"
  depends_on         = [module.vnet]
}

module "vm_name" {
  source             = "../../child/virtualmachine"
  resource_group     = "hclrg1"
  location           = "Central India"
  vm_namef           = "hcl-vmf"
  vm_nameb           = "hcl-vmb"
  nic_namef          = "hcl-nicf"
  nic_nameb          = "hcl-nicb"
  subnetfront_name   = "subnet-front"
  subnetbackend_name = "subnet-back"
  vnet_name          = "hcl-vnet"
  depends_on         = [module.subnetfront]

}
module "public_ip" {
  source         = "../../child/pip"
  resource_group = "hclrg1"
  location       = "Central India"
  public_ip      = "hcl-pip"
  depends_on     = [module.resource_group, module.vm_name]

}
module "bastion_name" {
  source         = "../../child/bastiion"
  resource_group = "hclrg1"
  location       = "Central India"
  bastion_name   = "hcl-bastion"
  vnet_name      = "hcl-vnet"
  subnet_name    = "AzureBastionSubnet"
  public_ip      = "hcl-pip"
  depends_on     = [module.public_ip, module.vm_name, module.resource_group]

}

module "pip1" {
  source         = "../../child/lbpip"
  resource_group = "hclrg1"
  location       = "Central India"
  lb_pip         = "hcl-lb-pip"
  depends_on     = [module.resource_group, module.vm_name]
}
module "lb" {
  source                          = "../../child/lb"
  lb_name                         = "hcl-lb"
  resource_group                  = "hclrg1"
  location                        = "Central India"
  lb_frontend_ip_name             = "hcl-frontend-ip"
  lb_pip                          = "hcl-lb-pip"
  azurerm_lb_backend_address_pool = "hcl-backend-pool"
  probe                           = "hcl-probe"
  rule_name                       = "hcl-rule"
  depends_on                      = [module.pip1, module.resource_group, module.vm_name]

}