terraform {
  backend "azurerm" {
    resource_group_name  = "terraformrg"
    storage_account_name = "terragit"
    container_name       = "terrastate"
    key                  = "apimxxxx1/terraform.tfstate"
  }
}
