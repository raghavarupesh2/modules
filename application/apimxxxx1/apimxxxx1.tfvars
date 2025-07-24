vms = {
  "linuxvm" = {
    provider_alias               = "default"
    resource_group_name          = "Terraformrg"
    location                     = "West US 2"
    vm_size                      = "Standard_D2ads_v6"
    admin_username               = "puser"
    admin_ssh_public_key         = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwhEtNh/awy0oesKHkihuqH4VZK0K6hXhIkxtHED9fUnI25Pk7/yZvofP/0+vTaMF7nsKqGB7DMbgQLi5p+YPzYl8cqXJY0QSvdcFFzU898/W9+xkL/rB6e16zXrB6OXUrAfdxBZMXGBJR9YYdAHeTBS2wnFFirz02FyOUNNPSlqP3m3fa2QgMjErzl2f7pxxf7sICJ0+f9CzCbnZS2gBEOMd1L6wa3ricUdYPpjGByFElr0gRlO3xCwhOoducfqUDDm2huf8kcc8hJiBX/qDk2cBD66Yqvaf7zl4qTDbtWDxCYrbBzwrLh4dWovh6G5gWGdzFkPRSfYGenHTb/hzBAtUErb4Qm1CCJc2ANzTbqULw+BDqjd4e9Lpzwv1bUU0uCihKvCxVSD4T10BI70p/V/jeAT/GCqBJw0COgCQaefb9i+JoAj/gBNsyKK105iMuzddMoays0Vv30JD2uIJY+L2SQVujq6gtNBU6AmVbGADKnLp/kxPg0xCyn+CubF0= generated-by-azure"
    network_interface_ids        = ["/subscriptions/888e7a98-44ab-4dc4-b0d3-a14548e8ab06/resourceGroups/Terraformrg/providers/Microsoft.Network/networkInterfaces/linuxvm791"]
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    os_disk_disk_size_gb         = 64
    source_image_publisher       = "RedHat"
    source_image_offer           = "RHEL"
    source_image_sku             = "94_gen2"
    source_image_version         = "latest"
    os_type                      = "linux"
  }

  "raghavaw" = {
    provider_alias      = "default"
    resource_group_name = "Terraformrg"
    location            = "West US 2"
    vm_size             = "Standard_DS1_v2"
    admin_username      = "azureadmin"
    network_interface_ids = [
      "/subscriptions/888e7a98-44ab-4dc4-b0d3-a14548e8ab06/resourceGroups/Terraformrg/providers/Microsoft.Network/networkInterfaces/raghavaw216"
    ]
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    os_disk_disk_size_gb         = 127
    source_image_publisher       = "MicrosoftWindowsServer"
    source_image_offer           = "WindowsServer"
    source_image_sku             = "2019-Datacenter"
    source_image_version         = "latest"
    os_type                      = "windows"
  }

}