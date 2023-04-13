#!/bin/bash
#
# Script to deploy Cloud network Controller to Azure
# Script detail sourced from "https://github.com/soumukhe/azure_cAPIC-Terraform_Deploy/blob/main/azcapic.sh"
# Recommended reading "https://unofficialaciguide.com/2022/04/18/deploying-capic-on-azure-with-terraform/#ref"

# Refresh Login to microsoft graph for IAM updates
az login --scope https://graph.microsoft.com//.default

resourceGroup="cnc-infra"
location="westus2"

# Create Cloud Network Controller Infra Resource Group
az group create -n $resourceGroup -l $location

# Deploy Cloud Network Controller Template
az deployment group create --name "cisco-cnc-2505" \
--resource-group $resourceGroup \
--template-file cnc_template/template.json \
--parameters adminPasswordOrKey=$AZ_CNC_PASSWORD adminPublicKey=$AZ_CNC_SSHPUBKEY \
_artifactsLocation="https://catalogartifact.azureedge.net/publicartifacts/cisco.cisco-aci-cloud-apic-0e913244-4ced-4feb-a694-9da3baccf73d-26_0_1-byol/Artifacts/mainTemplate.json" \
--subscription $AZ_CNC_SUBSCRIPTION

# Add CNC VM to the Contributor Role
cncId=$(az vm show --name "CloudNetworkController" \
--resource-group $resourceGroup \
--query 'identity.principalId' \
-o tsv)

az role assignment create --assignee-object-id $cncId --role "Contributor"

# Return Public IP Address of CloudNetworkController

echo "Cloud Network Controller is Deployed please what approx 5 min for application to be fully available"
az vm show -d -g $resourceGroup -n "CloudNetworkController" --query publicIps -o tsv
