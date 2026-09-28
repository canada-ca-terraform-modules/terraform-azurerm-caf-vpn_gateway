variable "env" {
  description = "(Required) Environment for the VPN Gateway"
  type        = string
}

variable "group" {
  description = "(Required) Group for the project"
  type        = string
}

variable "project" {
  description = "(Required) Project name"
  type        = string
}

variable "userDefinedString" {
  description = "(Required) UserDefinedString for the VPN Gateway"
  type        = string
}

variable "location" {
  description = "(Required) specifies the Azure location where the resource exists"
  type        = string
  default     = "canadacentral"
}

variable "resource_groups" {
  description = "(Required) Resource group object for the VPN Gateway"
  type        = any
}

variable "vpn_gateway" {
  description = <<EOT
VPN Gateway object containing all parameters. Supported properties include:
  - resource_group (Required): key in resource_groups map, or a full resource group ID
  - virtual_hub_id (Required): the ID of the Virtual Hub within which this VPN Gateway should be created
  - bgp_route_translation_for_nat_enabled (Optional): defaults to false
  - routing_preference (Optional): "Microsoft Network" (default) or "Internet"
  - scale_unit (Optional): defaults to 1
  - bgp_settings (Optional): object with asn, peer_weight, instance_0_bgp_peering_address,
    instance_1_bgp_peering_address
  - tags (Optional)
EOT
  type        = any
  default     = {}
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}
