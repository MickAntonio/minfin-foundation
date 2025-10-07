remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-tfstate-dev"
    storage_account_name = "saminfinstate037"
    container_name       = "terraform"
    key                  = "minfin-foundation/${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      backend "azurerm" {}
    }
  EOF
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    provider "azurerm" {
      features {}
      subscription_id = "4f475d8b-9d50-4bf4-a505-997e24e12f91"
    }
  EOF
}




