output "vm_ids" {
  value = { for k, m in module.linuxvm : k => m.vm_id }
}


