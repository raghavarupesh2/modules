output "linux_vm_id" {
  value = { for k, m in module.linux_vm : k => m.vm_id }
}
/*output "windows_vm_id" {
  value = module.windows_vm["windowsvm"].vm_id
}
*/
