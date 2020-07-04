resource "azurerm_route_table" "route_table" {
  name                          = var.route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = false

  tags = {
    Name = var.route_table_name
  }
}

resource "azurerm_subnet_route_table_association" "subnet_rt_assc" {
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.route_table.id
}