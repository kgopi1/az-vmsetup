MySecureRg="cloudopslab-rg"
MySecureVM="dev-vm-restore2"
MySecureVault="Dev-VM-DiskVault"
MyKEK_URI="https://dev-vm-diskvault.vault.azure.net/"
MySecureVaultContainingTheKEK="https://dev-vm-diskvault.vault.azure.net:443/keys/uQjhcJ3eVc/409ac983c32846a991f841a8b3ed7b1b"
volumetype="All"
# [All|OS|Data]

#az vm encryption enable --resource-group $MySecureRg --name $MySecureVM --disk-encryption-keyvault $MySecureVault --key-encryption-key $MyKEK_URI --key-encryption-keyvault $MySecureVaultContainingTheKEK --volume-type $volumetype
az vm encryption enable --resource-group "MySecureRg" --name "MySecureVM" --disk-encryption-keyvault  "MySecureVault" --key-encryption-key "MyKEK_URI" --key-encryption-keyvault "MySecureVaultContainingTheKEK" --volume-type [All|OS|Data]
