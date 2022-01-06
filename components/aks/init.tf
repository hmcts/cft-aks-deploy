terraform {
  required_version = ">= 1.0.10"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "2.77.0"
      configuration_aliases = [azurerm.hmcts-control]
    }
  }
}

provider "azurerm" {
  features {}
}

locals {

  control_resource_environment = var.environment == "perftest" ? "test" : var.environment == "aat" ? "stg" : var.environment == "ptlsbox" ? "sbox" : var.environment == "preview" ? "dev" : var.environment == "ptl" ? "prod" : "${var.environment}"

  environment = var.environment == "sbox" ? "sandbox" : var.environment == "test" ? "perftest" : var.environment == "ptlsbox" ? "cftsbox-intsvc" : var.environment == "ptl" ? "cftptl-intsvc" : "${var.environment}"

  environment-mi = var.environment == "sandbox" ? "sbox" : var.environment == "test" ? "perftest" : var.environment == "aat" ? "stg" : "${var.environment}"
  acr = {
    global = {
      subscription = "8999dec3-0104-4a27-94ee-6588559729d1"
    }
  }
}

provider "azurerm" {
  subscription_id            = local.mi_cft[var.environment].subscription
  skip_provider_registration = "true"
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
