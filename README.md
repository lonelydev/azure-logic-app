# Azure Logic Apps

This is the sample Azure Logic app used for the [post on Azure Logic Apps and Azure Pipelines](https://www.softwarecraftsperson.com/posts/2021-06-12-az-logic-app-pipeline/). The post is all about creating a Logic App on Visual Studio and then setting up an Azure Git Repository and Continuous Integration using YAML and Azure Pipelines on Azure Devops.

Also covers my adventures with integrating Azure Key Vaults and Secrets into the pipeline YAML.

## Project Structure

The resource manager template for the logic app and its params are inside the AzureLogicApp folder.

The `azure-pipelines` folder has the many different ways you can deploy a logic app. The idea was to try out creating pipelines that would:

- use values hardcoded
- use values from pipeline variables
- use values from pipeline variables stored as secrets
- use values from variable groups stored as secrets from azure keyvaults
- use values from Azure Key Vaults directly using a task specifically for that

I hope the names of the pipelines make sense.

The `az-kv-create-with-secrets.sh` has the Azure CLI commands to create a key vault from command line and also add secrets to it. Obviously, you'll have to change the values in the file to the corresponding values in your Azure subscription in order for it to work.

Good luck.