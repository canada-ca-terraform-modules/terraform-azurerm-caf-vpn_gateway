vpn_gateways = {
  example = {
    resource_group = "Project" # key in resource_groups map, or full Azure resource ID

    # Required: ID of the Virtual Hub (within a Virtual WAN) this gateway attaches to
    virtual_hub_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj/providers/Microsoft.Network/virtualHubs/example-hub"

    # Optional: enable BGP route translation for NAT. Defaults to false
    # bgp_route_translation_for_nat_enabled = true

    # Optional: "Microsoft Network" (default) or "Internet"
    # routing_preference = "Internet"

    # Optional: scale unit for the gateway. Defaults to 1
    # scale_unit = 2

    # Optional: uncomment to configure BGP peering with an on-prem VPN device
    # bgp_settings = {
    #   asn         = 65515
    #   peer_weight = 0
    #
    #   instance_0_bgp_peering_address = {
    #     custom_ips = ["169.254.21.5"]
    #   }
    #
    #   instance_1_bgp_peering_address = {
    #     custom_ips = ["169.254.21.9"]
    #   }
    # }

    # Optional: tags merged with the caller's tags
    # tags = {
    #   foo = "bar"
    # }
  }
}
