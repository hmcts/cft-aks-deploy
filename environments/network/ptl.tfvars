enable_debug = "true"

network_address_space                  = "10.10.72.0/21 "
aks_00_subnet_cidr_blocks              = "10.10.72.0/23"
aks_01_subnet_cidr_blocks              = "10.10.74.0/23"
iaas_subnet_cidr_blocks                = "10.10.78.0/23"
application_gateway_subnet_cidr_blocks = "10.10.70.0/25"

additional_subnets = [
]

private_dns_subscription = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
private_dns_zones = [
  "aat.platform.hmcts.net",
  "demo.platform.hmcts.net",
  "dev.platform.hmcts.net",
  "dom1.infra.int",
  "ethosldata.platform.hmcts.net",
  "ithc.platform.hmcts.net",
  "mailrelay.internal.platform.hmcts.net",
  "mailrelay.platform.hmcts.net",
  "perftest.platform.hmcts.net",
  "platform.hmcts.net",
  "preview.platform.hmcts.net",
  "privatelink.blob.core.windows.net",
  "privatelink.database.windows.net",
  "privatelink.datafactory.azure.net",
  "privatelink.dev.azuresynapse.net",
  "privatelink.postgres.database.azure.com",
  "privatelink.sql.azuresynapse.com",
  "privatelink.vaultcore.azure.net",
  "prod.platform.hmcts.net",
  "reform.hmtcs.net",
  "service.core-compute-aat.internal",
  "service.core-compute-demo.internal",
  "service.core-compute-ethosldata.internal",
  "service.core-compute-idam-aat.internal",
  "service.core-compute-idam-aat2.internal",
  "service.core-compute-idam-demo.internal",
  "service.core-compute-idam-ethosldata.internal",
  "service.core-compute-idam-ithc.internal",
  "service.core-compute-idam-perftest.internal",
  "service.core-compute-idam-preview.internal",
  "service.core-compute-idam-prod.internal",
  "service.core-compute-idam-prod2.internal",
  "service.core-compute-ithc.internal",
  "service.core-compute-perftest.internal",
  "service.core-compute-preview.internal",
  "service.core-compute-prod.internal",
  "staging.platform.hmcts.net",
  "test.platform.hmcst.net",
]

hub = "prod"
additional_routes = [
  {
    name                   = "Internet"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.11.8.36"
  },
  {
    name                   = "sdsdev"
    address_prefix         = "10.145.0.0/18"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.11.72.36"
  },
  {
    name                   = "sdsptl"
    address_prefix         = "10.147.64.0/18"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.11.8.36"
  },
  {
    name                   = "dmz-ukw"
    address_prefix         = "10.49.69.0/24"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.49.72.36"
  },
  {
    name                   = "cftperftest"
    address_prefix         = "10.48.64.0/18"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.11.72.36"
  },
  {
    name                   = "cftithc"
    address_prefix         = "10.11.192.0/18"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.11.72.36"
  },
]

additional_routes_coreinfra = [
  {
    name                   = "aks-00"
    address_prefix         = "10.10.72.0/23"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.11.72.36"
  },
  {
    name                   = "aks-01"
    address_prefix         = "10.10.74.0/23"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.11.72.36"
  }
]
