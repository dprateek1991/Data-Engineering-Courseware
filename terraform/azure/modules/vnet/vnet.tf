resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space

  tags = {
    Name           =  var.vnet_name
  }
}

resource "azurerm_subnet" "subnet" {
  name                      = var.subnet_name
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.virtual_network.name
  address_prefix            = var.subnet_address_space
  
  lifecycle { 
     ignore_changes = [route_table_id, network_security_group_id]
  }

  service_endpoints         = var.subnet_service_endpoints
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}