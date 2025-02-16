terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "DenisSlyusarenko"
    storage_account_name = "denisslstorageacc"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
    access_key           = var.access_key
  }
}

provider "azurerm" {
  features {}
}
