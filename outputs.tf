output "kali_vm_private_ips" {
  description = "Private IPs of Kali VMs"
  value       = [for instance in aws_instance.kali_vm : instance.private_ip]
}