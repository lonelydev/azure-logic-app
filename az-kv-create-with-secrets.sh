#!/bin/bash -e
# A script to create an az KeyVault enabled for template deployment

#Change the values below before running the script
vaultName="fantastic-vault-name"               #Globally Unique Name of the KeyVault
vaultLocation="VaultLocation"           #Location of the KeyVault
resourceGroupName="ResourceGroupName"        #Name of the resource group for the vault
resourceGroupLocation="ResourceGroupLocation"   #Location of the resource group if it needs to be created

resourceGroupConnVarName="ResourceManagerConnection"
resourceGroupConnVarValue="ResourceManagerConVal"

subscriptionNameVarName="SubscriptionName"
subscriptionNameVarValue="SubvarValue"

resourceGroupVarName="ResourceGroup"
resourceGroupVarValue="ResGroupVal"

locationVarName="Location"
locationVarValue="SecretLocation"
#Login and Select the default subscription if needed
#az login
#az account set "subscription name"
#az config mode arm

#az group create "$resourceGroupName" "$resourceGroupLocation"

az keyvault create --name "$vaultName" --resource-group "$resourceGroupName" --location "$vaultLocation" --enabled-for-template-deployment true

az keyvault secret set --vault-name "$vaultName" --name "resourceGroupConnVarName" --value "resourceGroupConnVarValue"
az keyvault secret set --vault-name "$vaultName" --name "subscriptionNameVarName" --value "subscriptionNameVarValue"
az keyvault secret set --vault-name "$vaultName" --name "resourceGroupVarName" --value "resourceGroupVarValue"
az keyvault secret set --vault-name "$vaultName" --name "locationVarName" --value "locationVarValue"

