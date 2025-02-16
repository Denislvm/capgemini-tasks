output "subnet_id" {
  value = azurerm_subnet.example.id
}

output "lb_public_ip_id" {
  value = azurerm_public_ip.example.id
}

output "lb_public_ip" {
  value = azurerm_public_ip.example.ip_address
}