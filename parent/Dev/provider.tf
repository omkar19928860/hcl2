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
  subscription_id = "70d13209-b5da-483b-9f07-a91b9e1a684b"
}

