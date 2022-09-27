enable_debug = "true"

################################################################################
# Network configuration
################################################################################

network_address_space                  = "10.2.8.0/21"
aks_00_subnet_cidr_blocks              = "10.2.8.0/23"
aks_01_subnet_cidr_blocks              = "10.2.10.0/23"
iaas_subnet_cidr_blocks                = "10.2.12.0/24"
application_gateway_subnet_cidr_blocks = "10.2.13.0/25"
postgresql_subnet_cidr_blocks          = "10.2.14.128/25"

additional_subnets = [
  {
    name           = "api-management"
    address_prefix = "10.2.14.0/25"
  },
  {
    name           = "private-endpoints"
    address_prefix = "10.2.15.0/24"
  },
]

private_dns_subscription = "1497c3d7-ab6d-4bb7-8a10-b51d03189ee3"
private_dns_zones = [
  "sandbox.platform.hmcts.net",
  "sbox.platform.hmcts.net",
  "service.core-compute-sandbox.internal",
  "service.core-compute-idam-sandbox.internal",
  "service.core-compute-idam-saat.internal"
]

hub = "sbox"

additional_routes = [
  {
    name                   = "10_0_0_0"
    address_prefix         = "10.0.0.0/8"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.200.36"
  },
  {
    name                   = "172_16_0_0"
    address_prefix         = "172.16.0.0/12"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.200.36"
  },
  {
    name                   = "192_168_0_0"
    address_prefix         = "192.168.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.200.36"
  }
]

additional_routes_appgw = [
  {
    name                   = "core_infra_vnet_idam_sandbox"
    address_prefix         = "10.99.128.0/18"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.200.36"
  },
  {
    name                   = "core-infra-vnet-sandbox"
    address_prefix         = "10.100.128.0/18"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.200.36"
  }
]

additional_routes_coreinfra = [
  {
    name                   = "aks-00"
    address_prefix         = "10.2.8.0/23"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.200.36"
  },
  {
    name                   = "aks-01"
    address_prefix         = "10.2.10.0/23"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.200.36"
  }
]

coreinfra_subnets = [
  {
    name = "core-infra-subnet-0-sandbox"
  },
  {
    name = "core-infra-subnet-1-sandbox"
  },
  {
    name = "elasticsearch"
  },
  {
    name = "scan-storage"
  },
  {
    name = "core-infra-subnet-apimgmt-sandbox"
  }
]

################################################################################
# Kubernetes configuration
################################################################################

cluster_count                      = 2
kubernetes_cluster_version         = "1.23"
kubernetes_cluster_ssh_key         = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeRwSzSKJfjmIVQ6CUld/M3vF9Hcfxh5cLBa1BV+UZDh5p1gKoB0xRegSFdncfup1qMAhrZtgBpaclLiYUfe8ZajPp1Lmva9AJuK/UktzF9stZie7LDpflEdVBXlSZw3AtAWxF2vIkEeW+NVYlGAJOQlasFkmGTkco+O1wUM4LGI3YNHm7r70rnmHT2djoR1t4x1jlPCrXaJEhvtyxf01Dwjq2nWaox3puJtHs5DLFpEIvXvHwQWssFFyKIuwkm4FewHKJSbCahyaCb+ac10MAZg9vZnWq0EYOe1nLn7c3538yJ9WJh7jRFZDza6ab9HVb5hgJ3/t/K+EzkU/XGSEJ"
enable_user_system_nodepool_split  = true
project_acr_enabled                = true

system_node_pool = {
  min_nodes = 2,
  max_nodes = 4
}
linux_node_pool = {
  min_nodes = 4,
  max_nodes = 10
}

availability_zones = ["1"]
