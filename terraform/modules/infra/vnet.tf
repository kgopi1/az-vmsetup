resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnetname}"
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}"
  address_space = ["${var.vnetaddress}"]
  tags = "${merge(map(
    "Name", "${var.tags["environment"]}-Vnet",
    "Description", "${var.tags["environment"]} Vnet"),
    var.tags
)}"
}
