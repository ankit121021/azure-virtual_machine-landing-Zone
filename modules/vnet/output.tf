output "vnet_output" {
  value = {
    for k, v in azurerm_virtual_network.vnet : k => {
      id                  = v.id
      name                = v.name
      resource_group_name = v.resource_group_name
    }
  }
}