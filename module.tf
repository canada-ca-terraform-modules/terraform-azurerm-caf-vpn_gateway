resource "azurerm_vpn_gateway" "vpn_gateway" {
  name                = local.vpn_gateway_name
  resource_group_name = local.resource_group_name
  location            = var.location
  virtual_hub_id      = var.vpn_gateway.virtual_hub_id

  # Optional top-level parameters
  bgp_route_translation_for_nat_enabled = try(var.vpn_gateway.bgp_route_translation_for_nat_enabled, false)
  routing_preference                    = try(var.vpn_gateway.routing_preference, "Microsoft Network")
  scale_unit                            = try(var.vpn_gateway.scale_unit, 1)

  # Optional single-instance block
  dynamic "bgp_settings" {
    for_each = try(var.vpn_gateway.bgp_settings, null) != null ? [1] : []
    content {
      asn         = var.vpn_gateway.bgp_settings.asn
      peer_weight = var.vpn_gateway.bgp_settings.peer_weight

      dynamic "instance_0_bgp_peering_address" {
        for_each = try(var.vpn_gateway.bgp_settings.instance_0_bgp_peering_address, null) != null ? [1] : []
        content {
          custom_ips = var.vpn_gateway.bgp_settings.instance_0_bgp_peering_address.custom_ips
        }
      }

      dynamic "instance_1_bgp_peering_address" {
        for_each = try(var.vpn_gateway.bgp_settings.instance_1_bgp_peering_address, null) != null ? [1] : []
        content {
          custom_ips = var.vpn_gateway.bgp_settings.instance_1_bgp_peering_address.custom_ips
        }
      }
    }
  }

  tags = merge(var.tags, try(var.vpn_gateway.tags, {}))
}
