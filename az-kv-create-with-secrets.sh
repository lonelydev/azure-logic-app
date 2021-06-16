#!/bin/bash -e
# A script to create an az KeyVault enabled for template deployment

#Change the values below before running the script
vaultName="az-lga-sendgrid-vault"               #Globally Unique Name of the KeyVault
vaultLocation="UK South"           #Location of the KeyVault
resourceGroupName="AzureLogicApp"        #Name of the resource group for the vault
resourceGroupLocation="UK South"   #Location of the resource group if it needs to be created

resourceGroupConnVarName="ResourceManagerConnection"
resourceGroupConnVarValue="Pluralsight (d6d0fd8c-aab6-4713-b2f1-c9a0375d687d)"

subscriptionNameVarName="SubscriptionName"
subscriptionNameVarValue="d6d0fd8c-aab6-4713-b2f1-c9a0375d687d"

resourceGroupVarName="ResourceGroup"
resourceGroupVarValue="$resourceGroupName"

locationVarName="Location"
locationVarValue="$resourceGroupLocation"
#Login and Select the default subscription if needed
#az login
#az account set "subscription name"
#az config mode arm

#az group create "$resourceGroupName" "$resourceGroupLocation"

az keyvault create --name "$vaultName" --resource-group "$resourceGroupName" --location "$vaultLocation" --enabled-for-template-deployment true

az keyvault secret set --vault-name "$vaultName" --name "$resourceGroupConnVarName" --value "$resourceGroupConnVarValue"
az keyvault secret set --vault-name "$vaultName" --name "$subscriptionNameVarName" --value "$subscriptionNameVarValue"
az keyvault secret set --vault-name "$vaultName" --name "$resourceGroupVarName" --value "$resourceGroupVarValue"
az keyvault secret set --vault-name "$vaultName" --name "$locationVarName" --value "$locationVarValue"

