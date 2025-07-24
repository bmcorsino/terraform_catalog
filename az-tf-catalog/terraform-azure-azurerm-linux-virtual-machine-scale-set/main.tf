resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                = var.azurerm_scale_set_name
  resource_group_name = var.azurerm_scale_set_resource_group
  location            = var.azurerm_scale_set_region
  sku                 = var.azurerm_scale_set_sku
  instances           = var.azurerm_scale_set_instances
  admin_username      = var.azurerm_scale_set_admin_username

  admin_ssh_key {
    username   = var.azurerm_scale_set_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = var.azurerm_scale_set_image_publisher
    offer     = var.azurerm_scale_set_image_offer
    sku       = var.azurerm_scale_set_image_sku
    version   = var.azurerm_scale_set_image_version
  }

  os_disk {
    storage_account_type = var.azurerm_scale_set_storage_account_type
    caching              = var.azurerm_scale_set_storage_account_caching
  }

  network_interface {
    name    = var.azurerm_scale_set_network_interface_name
    primary = var.azurerm_scale_set_network_interface_primary

    ip_configuration {
      name      = var.azurerm_scale_set_network_interface_ip_name
      primary   = var.azurerm_scale_set_network_interface_ip_primary
      subnet_id = var.azurerm_scale_set_network_interface_ip_subnet_id
    }
  }
}