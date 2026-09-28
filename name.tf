locals {
  vpn_gateway_regex                             = "/[^0-9a-z]/"
  env-regex_compliant_4                         = replace(lower(substr(var.env, 0, 4)), local.vpn_gateway_regex, "")
  group-regex_compliant                         = replace(lower(var.group), local.vpn_gateway_regex, "")
  project-regex_compliant                       = replace(lower(var.project), local.vpn_gateway_regex, "")
  vpn_gateway-userDefinedString-regex_compliant = replace(lower(var.userDefinedString), local.vpn_gateway_regex, "")
  vpn_gateway_prefix                            = "${local.env-regex_compliant_4}-${local.group-regex_compliant}-${local.project-regex_compliant}"
  vpn_gateway_suffix                            = "-vpng"
  vpn_gateway_name                              = "${substr("${local.vpn_gateway_prefix}-${local.vpn_gateway-userDefinedString-regex_compliant}", 0, 64 - length(local.vpn_gateway_suffix))}${local.vpn_gateway_suffix}"
}
