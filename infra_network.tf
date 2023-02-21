resource "azurerm_virtual_network" "vnet_main" {
  name                = "vnet-main"
  location            = azurerm_resource_group.rg_main.location
  resource_group_name = azurerm_resource_group.rg_main.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "snet-workload-001"
    address_prefix = "10.0.0.64/26"
  }

  subnet {
    name           = "snet-workload-002"
    address_prefix = "10.0.0.128/26"
  }

  subnet {
    name           = "snet-workload-003"
    address_prefix = "10.0.0.192/26"
  }

  tags = {
    environment = "Testing"
  }
}

resource "azurerm_subnet" "snet_bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.rg_main.name
  virtual_network_name = azurerm_virtual_network.vnet_main.name
  address_prefixes     = ["10.0.0.0/26"]
}