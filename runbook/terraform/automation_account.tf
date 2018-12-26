#terraform import azurerm_automation_account.account1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/group1/providers/Microsoft.Automation/automationAccounts/account1

resource "azurerm_automation_account" "labrgautomation" {
  name                = "labrgautomation"
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}"

  sku {
    name = "Basic"
  }
  tags = "${merge(map(
    "Description", "${var.tags["environment"]} AzureAutomation"),
    var.tags
  )}"
  }

# data "local_file" "example" {
#   filename = "${path.module}/example.ps1"
# }
