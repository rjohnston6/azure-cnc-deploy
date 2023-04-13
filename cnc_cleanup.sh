#!/bin/bash
#
# Script to deploy Cloud network Controller to Azure
# Script detail sourced from "https://github.com/soumukhe/azure_cAPIC-Terraform_Deploy/blob/main/azcapic.sh"
# Recommended reading "https://unofficialaciguide.com/2022/04/18/deploying-capic-on-azure-with-terraform/#ref"
#

resourceGroup="cnc-infra"

az group delete --name $resourceGroup

echo "Remove Contributor IAM assignment in Portal for Cleanup"
