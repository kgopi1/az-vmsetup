# ##create keyvault
# resource "azurerm_key_vault" "test" {
#   name                        = "testvault"
#   location                    = "${azurerm_resource_group.test.location}"
#   resource_group_name         = "${azurerm_resource_group.test.name}"
#   enabled_for_disk_encryption = true
#   tenant_id                   = "d6e396d0-5584-41dc-9fc0-268df99bc610"
#
#   sku {
#     name = "standard"
#   }
#
#   access_policy {
#     tenant_id = "d6e396d0-5584-41dc-9fc0-268df99bc610"
#     object_id = "d746815a-0433-4a21-b95d-fc437d2d475b"
#
#     key_permissions = [
#       "get",
#     ]
#
#     secret_permissions = [
#       "get",
#     ]
#   }
#
#   network_acls {
#     default_action             = "Deny"
#     bypass                     = "AzureServices"
#   }
#
#   tags {
#     environment = "Production"
#   }
# }
