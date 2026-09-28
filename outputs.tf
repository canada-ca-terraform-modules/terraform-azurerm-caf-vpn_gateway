output "vpn_gateway_object" {
  description = "Outputs the entire VPN Gateway object"
  value       = azurerm_vpn_gateway.vpn_gateway
}

output "vpn_gateway_id" {
  description = "Outputs the id of the VPN Gateway"
  value       = azurerm_vpn_gateway.vpn_gateway.id
}

output "vpn_gateway_name" {
  description = "Outputs the name of the VPN Gateway"
  value       = azurerm_vpn_gateway.vpn_gateway.name
}

output "vpn_gateway_bgp_settings" {
  description = "Outputs the bgp_settings block of the VPN Gateway, including the pre-defined BGP peering addresses used when configuring on-prem VPN sites"
  value       = azurerm_vpn_gateway.vpn_gateway.bgp_settings
}

output "vpn_gateway_ip_configuration" {
  description = "Outputs the ip_configuration block of the VPN Gateway"
  value       = azurerm_vpn_gateway.vpn_gateway.ip_configuration
}
