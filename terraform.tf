terraform {
  required_version = ">= 1.9"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # Widened (not pinned to ~> 5.0 like sibling modules) so this module stays
      # usable by consumers still on the 4.x provider line - azurerm_vpn_gateway
      # and every argument this module wraps (bgp_settings, routing_preference,
      # scale_unit) are unchanged since well before 4.9.
      version = ">= 4.9.0, < 6.0.0"
    }
  }
}
