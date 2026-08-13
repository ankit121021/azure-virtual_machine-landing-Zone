rgs = {
  rg1 = {
    name     = "rg-ankit"
    location = "korea central"
  }
}
vnet = {
  vnet1 = {
    name                = "vnet-ankit"
    location            = "korea central"
    resource_group_name = "rg-ankit"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
  }
}


subnet = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-ankit"
    virtual_network_name = "vnet-ankit"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {

    name                 = "backend-subnet"
    resource_group_name  = "rg-ankit"
    virtual_network_name = "vnet-ankit"
    address_prefixes     = ["10.0.2.0/24"]
  }

}
public_ip = {
  pip1 = {
    name                = "frontend-pip"
    resource_group_name = "rg-ankit"
    location            = "korea central"
    allocation_method   = "Static"
  }
}

nic = {
  nic1 = {
    name                 = "frontend-nic"
    location             = "korea central"
    resource_group_name  = "rg-ankit"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "vnet-ankit"
    public_name          = "frontend-pip"


    ip_configuration = {

      name                          = "internal"
      private_ip_address_allocation = "Dynamic"
    }

  }


}

vm = {
  vm1 = {

    name                = "linux-vm"
    resource_group_name = "rg-ankit"
    location            = "korea central"
    size                = "Standard_D4_v5"
    admin_username      = "admin_ankit"
    admin_password      = "Ankit@12345"

    disable_password_authentication = false

    nic_name = "frontend-nic"


    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


