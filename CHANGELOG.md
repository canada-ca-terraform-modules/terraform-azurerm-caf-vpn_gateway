# Changelog

All notable changes to this module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Changed

- Widened the `azurerm` provider constraint from `~> 5.0` to `>= 4.9.0, < 6.0.0` so the
  module stays usable by consumers still on the 4.x provider line (e.g. `L1_blueprint_base`).

## [1.0.0]

### Added

- Initial scaffold of the `terraform-azurerm-caf-vpn_gateway` module wrapping
  `azurerm_vpn_gateway`.
- Support for `bgp_route_translation_for_nat_enabled`, `routing_preference`, `scale_unit`.
- Support for the `bgp_settings` block, including `instance_0_bgp_peering_address` and
  `instance_1_bgp_peering_address`.
- ESLZ wrapper (`ESLZ/VpnGateway.tf`) and example tfvars (`ESLZ/VpnGateway.tfvars`).
- Baseline test coverage (`tests/vpn_gateway.tftest.hcl`).
- Live-test CI harness (`test/live/`) wired to the shared OIDC sandbox identity.
