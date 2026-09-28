mock_provider "azurerm" {}

variables {
  env               = "Dev"
  group             = "SLRD"
  project           = "test"
  userDefinedString = "gw"
  location          = "canadacentral"
  resource_groups = {
    Project = { name = "rg-proj", id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj" }
  }
  tags = { environment = "dev" }
}

# ─── naming_convention ──────────────────────────────────────────────────────
run "naming_convention" {
  command = plan

  variables {
    vpn_gateway = {
      resource_group = "Project"
      virtual_hub_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj/providers/Microsoft.Network/virtualHubs/example-hub"
    }
  }

  assert {
    condition     = azurerm_vpn_gateway.vpn_gateway.name == "dev-slrd-test-gw-vpng"
    error_message = "Name must follow {env4}-{group}-{project}-{userDefinedString}-vpng convention"
  }
}

# ─── default_values ─────────────────────────────────────────────────────────
run "default_values" {
  command = plan

  variables {
    vpn_gateway = {
      resource_group = "Project"
      virtual_hub_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj/providers/Microsoft.Network/virtualHubs/example-hub"
    }
  }

  assert {
    condition     = azurerm_vpn_gateway.vpn_gateway.location == "canadacentral"
    error_message = "Default location must apply when not overridden"
  }

  assert {
    condition     = azurerm_vpn_gateway.vpn_gateway.scale_unit == 1
    error_message = "Default scale_unit must be 1"
  }

  assert {
    condition     = azurerm_vpn_gateway.vpn_gateway.routing_preference == "Microsoft Network"
    error_message = "Default routing_preference must be Microsoft Network"
  }

  assert {
    condition     = azurerm_vpn_gateway.vpn_gateway.bgp_route_translation_for_nat_enabled == false
    error_message = "Default bgp_route_translation_for_nat_enabled must be false"
  }
}

# ─── custom_scale_and_routing ───────────────────────────────────────────────
run "custom_scale_and_routing" {
  command = plan

  variables {
    vpn_gateway = {
      resource_group                        = "Project"
      virtual_hub_id                        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj/providers/Microsoft.Network/virtualHubs/example-hub"
      scale_unit                            = 2
      routing_preference                    = "Internet"
      bgp_route_translation_for_nat_enabled = true
    }
  }

  assert {
    condition     = azurerm_vpn_gateway.vpn_gateway.scale_unit == 2
    error_message = "scale_unit override must apply"
  }

  assert {
    condition     = azurerm_vpn_gateway.vpn_gateway.routing_preference == "Internet"
    error_message = "routing_preference override must apply"
  }
}

# ─── bgp_settings ────────────────────────────────────────────────────────────
run "bgp_settings" {
  command = plan

  variables {
    vpn_gateway = {
      resource_group = "Project"
      virtual_hub_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj/providers/Microsoft.Network/virtualHubs/example-hub"
      bgp_settings = {
        asn         = 65515
        peer_weight = 0
        instance_0_bgp_peering_address = {
          custom_ips = ["169.254.21.5"]
        }
        instance_1_bgp_peering_address = {
          custom_ips = ["169.254.21.9"]
        }
      }
    }
  }

  assert {
    condition     = azurerm_vpn_gateway.vpn_gateway.bgp_settings[0].asn == 65515
    error_message = "bgp_settings.asn must be configured"
  }

  assert {
    condition     = tolist(tolist(azurerm_vpn_gateway.vpn_gateway.bgp_settings[0].instance_0_bgp_peering_address)[0].custom_ips)[0] == "169.254.21.5"
    error_message = "instance_0_bgp_peering_address must be configured"
  }

  assert {
    condition     = tolist(tolist(azurerm_vpn_gateway.vpn_gateway.bgp_settings[0].instance_1_bgp_peering_address)[0].custom_ips)[0] == "169.254.21.9"
    error_message = "instance_1_bgp_peering_address must be configured"
  }
}
