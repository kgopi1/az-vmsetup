resource "azurerm_subnet" "subnet" {
  name                 = "${var.subnetname}"
  resource_group_name  = "${var.rgname}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${var.subnetrange}"
  network_security_group_id = "${azurerm_network_security_group.devnsg01.id}"
  #azurerm_subnet_network_security_group_association = "${azurerm_network_security_group.devnsg01.id}"
}
