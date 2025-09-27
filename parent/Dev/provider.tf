terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "hclrg"
    storage_account_name = "hclsa456233"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "8b10287d-12d6-41e3-b62c-33457c006e96"
}

