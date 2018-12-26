resource "azurerm_virtual_machine" "vmcore" {
  count = "${var.vmcount}"
  name                  = "${var.vmhostname}${format("%02d",count.index+1)}"
  location              = "${var.rglocation}"
  resource_group_name   = "${var.rgname}"
  network_interface_ids = ["${azurerm_network_interface.vmnic.*.id[count.index]}"]
  vm_size               = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true


  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true
## To get the image rerference use az vm image list -o table ##
  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  storage_os_disk {
    name = "${var.vmhostname}${format("%02d",count.index+1)}-osdisk"
    #name              = "osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.vmhostname}${format("%02d",count.index+1)}"
    admin_username = "testadmin"
    admin_password = ""
  }
  os_profile_windows_config {
   provision_vm_agent = true
 }

 boot_diagnostics {
   enabled     = "true"
   storage_uri = "${azurerm_storage_account.disksgacct.primary_blob_endpoint}"
 }
 tags = "${merge(map(
   "Description", "${var.tags["environment"]} VM"),

   var.tags
)}"
}
## "AutoShutdownSchedule","22:00 -> 06:00"
