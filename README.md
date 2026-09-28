# terraform-azurerm-caf-vpn_gateway

Deploys an Azure VPN Gateway within a Virtual Hub (`azurerm_vpn_gateway`), covering BGP
settings (including on-prem peering addresses), routing preference, scale unit, and BGP
route translation for NAT. Requires azurerm `>= 4.9.0, < 6.0.0`.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.9.0, < 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 5.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_vpn_gateway.vpn_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | (Required) Environment for the VPN Gateway | `string` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | (Required) Group for the project | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) specifies the Azure location where the resource exists | `string` | `"canadacentral"` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required) Project name | `string` | n/a | yes |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | (Required) Resource group object for the VPN Gateway | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources | `map(string)` | `{}` | no |
| <a name="input_userDefinedString"></a> [userDefinedString](#input\_userDefinedString) | (Required) UserDefinedString for the VPN Gateway | `string` | n/a | yes |
| <a name="input_vpn_gateway"></a> [vpn\_gateway](#input\_vpn\_gateway) | VPN Gateway object containing all parameters. Supported properties include:<br/>  - resource\_group (Required): key in resource\_groups map, or a full resource group ID<br/>  - virtual\_hub\_id (Required): the ID of the Virtual Hub within which this VPN Gateway should be created<br/>  - bgp\_route\_translation\_for\_nat\_enabled (Optional): defaults to false<br/>  - routing\_preference (Optional): "Microsoft Network" (default) or "Internet"<br/>  - scale\_unit (Optional): defaults to 1<br/>  - bgp\_settings (Optional): object with asn, peer\_weight, instance\_0\_bgp\_peering\_address,<br/>    instance\_1\_bgp\_peering\_address<br/>  - tags (Optional) | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_gateway_bgp_settings"></a> [vpn\_gateway\_bgp\_settings](#output\_vpn\_gateway\_bgp\_settings) | Outputs the bgp\_settings block of the VPN Gateway, including the pre-defined BGP peering addresses used when configuring on-prem VPN sites |
| <a name="output_vpn_gateway_id"></a> [vpn\_gateway\_id](#output\_vpn\_gateway\_id) | Outputs the id of the VPN Gateway |
| <a name="output_vpn_gateway_ip_configuration"></a> [vpn\_gateway\_ip\_configuration](#output\_vpn\_gateway\_ip\_configuration) | Outputs the ip\_configuration block of the VPN Gateway |
| <a name="output_vpn_gateway_name"></a> [vpn\_gateway\_name](#output\_vpn\_gateway\_name) | Outputs the name of the VPN Gateway |
| <a name="output_vpn_gateway_object"></a> [vpn\_gateway\_object](#output\_vpn\_gateway\_object) | Outputs the entire VPN Gateway object |
<!-- END_TF_DOCS -->
