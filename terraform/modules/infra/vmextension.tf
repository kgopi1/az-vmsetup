#az vm extension image list --location westeurope -o table
#Name                                 Publisher                                             Version
#AzureDiskEncryption                  Microsoft.Azure.Security.Edp                          2.2.0.4
#IaaSAntimalware                      Microsoft.Azure.Security.Test                         1.5.2.0

resource "azurerm_virtual_machine_extension" "vmantivirus" {
  #name = "IaaSAntimalware"
  name                 = "${var.vnetname}-vmantivirus"
  location             = "${var.rglocation}"
  resource_group_name  = "${var.rgname}"
  virtual_machine_name = "${azurerm_virtual_machine.vmcore.name}"
  publisher            = "Microsoft.Azure.Security"
  type = "IaaSAntimalware"
  type_handler_version = "1.3"
  auto_upgrade_minor_version = "true"

settings = <<SETTINGS
{
"AntimalwareEnabled": true,
"RealtimeProtectionEnabled": "true",
"ScheduledScanSettings": {
"isEnabled": "true",
"day": "1",
"time": "120",
"scanType": "Quick"
},
"Exclusions": {
"Extensions": "",
"Paths": "",
"Processes": ""
}
}
SETTINGS

tags {
environment = "lab" }
}
