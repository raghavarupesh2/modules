variable "azure_client_id" {}
variable "azure_client_secret" {
  sensitive = true
}
variable "azure_tenant_id" {}
variable "sub1_subscription_id" {}
#variable "sub2_subscription_id" {}



variable "vms" {
  description = "Map of VMs to create"
  type = map(object({
    provider_alias               = string
    resource_group_name          = string
    location                     = string
    vm_size                      = string
    admin_username               = string
    admin_password               = optional(string)
    admin_ssh_public_key         = optional(string)
    network_interface_ids        = list(string)
    os_disk_caching              = string
    os_disk_storage_account_type = string
    os_disk_disk_size_gb         = number
    source_image_publisher       = string
    source_image_offer           = string
    source_image_sku             = string
    source_image_version         = string
    os_type                      = string # "linux" or "windows"
  }))
}
