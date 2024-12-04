terraform {
  required_version = ">= 1.0.10"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.117.0"
    }
  }
}

variable "subscription_id" {}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

provider "azurerm" {
  alias                      = "dts-cftptl-intsvc"
  skip_provider_registration = "true"
  features {}
  subscription_id = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
}

provider "azurerm" {
  subscription_id            = local.mi_cft[var.env].subscription_id
  skip_provider_registration = "true"
  features {}
  alias = "managed_identity_infra_sub"
}

provider "azurerm" {
  alias                      = "hmcts-control"
  skip_provider_registration = "true"
  features {}
  subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
}

// TODO delete after applying MI in all ENVs
// working around 'Error: Provider configuration not present'
provider "azurerm" {
  subscription_id            = local.acr[var.project].subscription
  skip_provider_registration = "true"
  features {}
  alias = "acr"
}

provider "azurerm" {
  subscription_id            = local.log_analytics_subscription_id
  skip_provider_registration = "true"
  features {}
  alias = "log_analytics"
}
