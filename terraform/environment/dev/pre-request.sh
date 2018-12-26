#! /bin/bash
## This shell script using Azure shell to create Resource Group and Storge account needed for the project.

rgname="cloudopslab-rg"
location="westeurope"
sgname="automationsg01"
sgkind="Storage"
sgsku="Standard_LRS"
sgcontainer="terraform"
az group create --name $rgname --location $location
#
az storage account create --name $sgname  --resource-group $rgname --kind $sgkind --sku $sgsku
#
az storage container create  --name $sgcontainer  --account-name $sgname

#To list the account keys used for provisioning
az storage account keys list -g $rgname -n $sgname
