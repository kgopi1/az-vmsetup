resource "azurerm_public_ip" "vmpublicip" {
  count = 1
  name                         = "${var.vmhostname}${format("%02d",count.index+1)}-publicip"
  location                     = "${var.rglocation}"
  resource_group_name          = "${var.rgname}"
  public_ip_address_allocation = "dynamic"
  tags = "${merge(map(
    "Name", "${var.vmhostname}${format("%02d",count.index+1)}-publicip",
    "Description", "${var.tags["environment"]} publicip-vms"),
    var.tags
)}"
}

resource "azurerm_network_interface" "vmnic" {
  count = "${var.vmcount}"
  name                = "${var.vmhostname}${format("%02d",count.index+1)}-NIC"
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}"


  ip_configuration {
    name                          = "${var.vmhostname}-${format("%02d",count.index+01)}-IP"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id = "${azurerm_public_ip.vmpublicip.*.id[count.index]}"
  }
  tags = "${merge(map(
    "Name", "${var.tags["environment"]}-nic",
    "Description", "${var.tags["environment"]} nic-vms"),
    var.tags
)}"
}
