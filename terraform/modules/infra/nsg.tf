resource "azurerm_network_security_group" "devnsg01" {
  name                = "${var.vnetname}-nsg"
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}"

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "86.0.230.142"
    destination_address_prefix = "VirtualNetwork"
  }

  tags = "${merge(map(
    "Name", "${var.tags["environment"]}-nsg",
    "Description", "${var.tags["environment"]} nsg"),
    var.tags
)}"
}
