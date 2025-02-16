resource "azurerm_virtual_network" "example" {
  name                = "acctvn"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_subnet" "example" {
  name                 = "acctsub"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "example" {
  name                = "test"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
  domain_name_label   = var.domain_name_label

  tags = {
    environment = "staging"
  }
}
