# resource "azurerm_storage_container" "sgacct" {
#   name                  = "${var.sgcont01}"
#   resource_group_name   = "${var.rgname}"
#   storage_account_name  = "${var.sgacctname}"
#   container_access_type = "private"
# }

resource "azurerm_storage_account" "disksgacct" {
  name                     = "${var.disksgacct01}"
  resource_group_name      = "${var.rgname}"
  location                 = "${var.rglocation}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = "${merge(map(
    "Name", "${var.tags["environment"]}-Storage",
    "Description", "${var.tags["environment"]} Disk Storage Account"),
    var.tags
)}"
}

resource "azurerm_managed_disk" "datadisk" {
  count = "${var.ddiskcount}"
  name                 = "${var.vmhostname}-datadisk${format("%02d",count.index+1)}"
  location             = "${var.rglocation}"
  resource_group_name  = "${var.rgname}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"

  tags {
    environment = "staging"
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadiskattach" {
  count = "${var.ddiskcount}"
  managed_disk_id    = "${azurerm_managed_disk.datadisk.*.id[count.index]}"
  #managed_disk_id    = "${azurerm_managed_disk.datadisk.id}"
  virtual_machine_id = "${azurerm_virtual_machine.vmcore.id}"
  lun                = "${count.index+10}"
  caching            = "ReadWrite"
}
