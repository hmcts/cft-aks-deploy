
terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "3.13.0"
      configuration_aliases = [azurerm.initiator, azurerm.target]
    }
  }
}