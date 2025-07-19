variable "vm_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "vm_size" {}
variable "admin_username" {}
variable "admin_ssh_public_key" {}
variable "network_interface_ids" { type = list(string) }
variable "os_disk_caching" {}
variable "os_disk_storage_account_type" {}
variable "os_disk_disk_size_gb" {}
variable "source_image_publisher" {}
variable "source_image_offer" {}
variable "source_image_sku" {}
variable "source_image_version" {}
