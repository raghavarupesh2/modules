provider "azurerm" {
  subscription_id = var.sub1_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  features {
    # Intentionally left empty; add specific features if needed in the future
  }
}
/*provider "azurerm" {
  alias           = "sub2"
  subscription_id = var.sub2_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  features        {}
}
provider "azurerm" {
  alias           = "sub3"
  subscription_id = var.sub3_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  features        {}
}
# ...add more as needed
provider "azurerm" {
  alias           = "sub4"
  subscription_id = var.sub4_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  features        {}
}

provider "azurerm" {
  alias           = "sub5"
  subscription_id = var.sub5_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  features        {}
}

*/