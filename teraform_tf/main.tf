terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }

  required_version = ">= 0.14"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "Caso_Practico_2" {
  name     = "test_caso_practico2"
  location = var.location
  tags = {
    environment = "CP2"
    source      = "Terraform"
  }
}

