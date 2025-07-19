module "linuxvm" {
  source = "../../modules/linuxvm"

  for_each = { for k, v in var.vms : k => v if v.os_type == "linux" && v.provider_alias == "default" }

  vm_name                      = each.key
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  vm_size                      = each.value.vm_size
  admin_username               = each.value.admin_username
  admin_ssh_public_key         = lookup(each.value, "admin_ssh_public_key", null)
  network_interface_ids        = each.value.network_interface_ids
  os_disk_caching              = each.value.os_disk_caching
  os_disk_storage_account_type = each.value.os_disk_storage_account_type
  os_disk_disk_size_gb         = each.value.os_disk_disk_size_gb
  source_image_publisher       = each.value.source_image_publisher
  source_image_offer           = each.value.source_image_offer
  source_image_sku             = each.value.source_image_sku
  source_image_version         = each.value.source_image_version
}

/*

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "linuxvm"
  resource_group_name             = "Terraformrg"
  location                        = "vWest US 2"
  computer_name                   = "linuxvm"
  size                            = "Standard_D2ads_v6" # Use the size from the variable  
  admin_username                  = "puser"
  disable_password_authentication = true  # Use SSH key for authentication      
  patch_mode                      = "ImageDefault"
  allow_extension_operations      = true
  disk_controller_type            = "NVMe"
  network_interface_ids           =  [

  "/subscriptions/888e7a98-44ab-4dc4-b0d3-a14548e8ab06/resourceGroups/Terraformrg/providers/Microsoft.Network/networkInterfaces/linuxvm791"
]
  


  admin_ssh_key {
    username   = "puser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwhEtNh/awy0oesKHkihuqH4VZK0K6hXhIkxtHED9fUnI25Pk7/yZvofP/0+vTaMF7nsKqGB7DMbgQLi5p+YPzYl8cqXJY0QSvdcFFzU898/W9+xkL/rB6e16zXrB6OXUrAfdxBZMXGBJR9YYdAHeTBS2wnFFirz02FyOUNNPSlqP3m3fa2QgMjErzl2f7pxxf7sICJ0+f9CzCbnZS2gBEOMd1L6wa3ricUdYPpjGByFElr0gRlO3xCwhOoducfqUDDm2huf8kcc8hJiBX/qDk2cBD66Yqvaf7zl4qTDbtWDxCYrbBzwrLh4dWovh6G5gWGdzFkPRSfYGenHTb/hzBAtUErb4Qm1CCJc2ANzTbqULw+BDqjd4e9Lpzwv1bUU0uCihKvCxVSD4T10BI70p/V/jeAT/GCqBJw0COgCQaefb9i+JoAj/gBNsyKK105iMuzddMoays0Vv30JD2uIJY+L2SQVujq6gtNBU6AmVbGADKnLp/kxPg0xCyn+CubF0= generated-by-azure"
  }
  boot_diagnostics {
    storage_account_uri = ""
  }


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 64
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "94_gen2"
    version   = "latest"
  }

  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
}
*/

/*
module "windows_vm" {
  source   = "../../modules/windows_vm"
  for_each = { for k, v in var.vms : k => v if v.os_type == "windows" && v.provider_alias == "default" }

  vm_name                      = each.key
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  vm_size                      = each.value.vm_size
  admin_username               = each.value.admin_username
  admin_password               = each.value.admin_password
  network_interface_ids        = each.value.network_interface_ids
  os_disk_caching              = each.value.os_disk_caching
  os_disk_storage_account_type = each.value.os_disk_storage_account_type
  os_disk_disk_size_gb         = each.value.os_disk_disk_size_gb
  source_image_publisher       = each.value.source_image_publisher
  source_image_offer           = each.value.source_image_offer
  source_image_sku             = each.value.source_image_sku
  source_image_version         = each.value.source_image_version
}
*/
