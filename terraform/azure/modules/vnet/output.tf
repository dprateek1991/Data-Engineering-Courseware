output "vnet_name"{
  value = azurerm_virtual_network.virtual_network.name
}

output "nsg_id"{
  value = azurerm_network_security_group.nsg.id
}

output "vnet_id"{
  value = azurerm_virtual_network.virtual_network.id
}

output "subnet_id"{
  value = azurerm_subnet.subnet.id
}