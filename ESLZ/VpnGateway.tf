variable "vpn_gateways" {
  description = "Map of VPN Gateway configurations. Each key becomes the userDefinedString."
  type        = any
  default     = {}
}

module "vpn_gateway" {
  source   = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-vpn_gateway?ref=v1.0.1"
  for_each = var.vpn_gateways

  env               = var.env
  group             = var.group
  project           = var.project
  userDefinedString = each.key
  location          = var.location
  tags              = local.tags
  resource_groups   = local.resource_groups

  vpn_gateway = each.value
}
