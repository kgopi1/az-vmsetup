provider "azurerm" {

}

terraform {
  backend "azurerm" {
    storage_account_name = "automationsg01"
    container_name       = "terraform"
    key                  = "dev.tfstate"
    access_key =   ""
  }
}
