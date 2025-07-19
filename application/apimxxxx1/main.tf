module "linux_vm" {
  source = "../../modules/linux_vm"

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

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  network_interface_ids           = var.network_interface_ids
  disable_password_authentication = true
}

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
