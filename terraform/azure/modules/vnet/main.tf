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
  address_prefixes          = var.subnet_address_space
  service_endpoints         = var.subnet_service_endpoints
}

resource "azurerm_route_table" "route_table" {
  name                          = var.route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = false

  tags = {
    Name = var.route_table_name
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_route_table_association" "subnet_rt_assc" {
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.route_table.id
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}