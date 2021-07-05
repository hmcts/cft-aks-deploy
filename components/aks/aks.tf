resource "azurerm_resource_group" "kubernetes_resource_group" {
  count    = var.cluster_count
  location = var.location

  name = format("%s-%s-%s-rg",
    var.project,
    var.environment,
    "0${count.index}"
  )
  tags = module.ctags.common_tags
}

resource "azurerm_resource_group" "disks_resource_group" {
  location = var.location
  name     = "disks-${var.control_resource_environment}-rg"
  tags     = module.ctags.common_tags
}

module "loganalytics" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.environment
}

module "kubernetes" {
  count  = var.cluster_count
  source = "git::https://github.com/hmcts/aks-module-kubernetes.git?ref=control-vault-access"

  control_resource_group = "azure-control-${local.control_resource_environment}-rg"
  environment            = var.environment
  location               = var.location

  sku_tier = var.sku_tier
  providers = {
    azurerm               = azurerm
    azurerm.hmcts-control = azurerm.hmcts-control
    azurerm.acr           = azurerm.acr
    azurerm.global_acr    = azurerm.global_acr
    azurerm.mi_cft        = azurerm.mi_cft
  }

  resource_group_name = azurerm_resource_group.kubernetes_resource_group[count.index].name

  network_name                = local.network_name
  network_shortname           = local.network_shortname
  network_resource_group_name = local.network_resource_group_name

  cluster_number    = "0${count.index}"
  service_shortname = var.service_shortname
  project           = var.project

  log_workspace_id           = module.loganalytics.workspace_id
  monitor_diagnostic_setting = var.monitor_diagnostic_setting

  control_vault = var.control_vault

  kubernetes_cluster_ssh_key = var.kubernetes_cluster_ssh_key

  kubernetes_cluster_agent_min_count = var.kubernetes_cluster_agent_min_count
  kubernetes_cluster_agent_max_count = var.kubernetes_cluster_agent_max_count
  kubernetes_cluster_agent_vm_size   = var.kubernetes_cluster_agent_vm_size
  kubernetes_cluster_version         = var.kubernetes_cluster_version
  kubernetes_cluster_agent_max_pods  = var.kubernetes_cluster_agent_max_pods

  tags = module.ctags.common_tags

  additional_node_pools = contains(["ptlsbox", "ptl"], var.environment) ? [] : [
  ]

  project_acr_enabled = var.project_acr_enabled

  depends_on = [azurerm_resource_group.disks_resource_group]
}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.environment
  product     = var.product
  builtFrom   = var.builtFrom
}