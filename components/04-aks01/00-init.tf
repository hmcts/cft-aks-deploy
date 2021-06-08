terraform {
  required_version = ">= 0.12.0"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.58.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  acr = {
    global = {
      subscription = "8999dec3-0104-4a27-94ee-6588559729d1"
    }
  }

  # MIs for managed-identities-sandbox-rg etc - they are RPE MIs
  mi_cft = {
    sbox = {
      subscription = "bf308a5c-0624-4334-8ff8-8dca9fd43783"
    }
    test = {
      subscription = "8a07fdcd-6abd-48b3-ad88-ff737a4b9e3c"
    }

  }

}

provider "azurerm" {
  # subscription_id            = local.acr[var.project].subscription
  # subscription_id            = local.acr["global"].subscription
  # skip_provider_registration = "true"
  features {}
  alias = "acr"
}

provider "azurerm" {
  subscription_id            = local.acr["global"].subscription
  skip_provider_registration = "true"
  features {}
  alias = "global_acr"
}

provider "azurerm" {
  alias                      = "hmcts-control"
  skip_provider_registration = "true"
  features {}
  subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
}

provider "azurerm" {
  alias                      = "mi_cft"
  skip_provider_registration = "true"
  features {}
  subscription_id = local.mi_cft[var.environment].subscription
}