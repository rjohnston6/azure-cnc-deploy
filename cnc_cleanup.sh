#!/bin/bash
#
# Copyright (c) 2023 Cisco and/or its affiliates.
#
# This software is licensed to you under the terms of the Cisco Sample
# Code License, Version 1.1 (the "License"). You may obtain a copy of the
# License at
#
#                https://developer.cisco.com/docs/licenses
#
# All use of the material herein must be in accordance with the terms of
# the License. All rights not expressly granted by the License are
# reserved. Unless required by applicable law or agreed to separately in
# writing, software distributed under the License is distributed on an "AS
# IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied.
#
# AUTHOR(s): Russell Johnston <rujohns2@cisco.com>
# CONTRIBUTOR(s): 
#
# Script to deploy Cloud network Controller to Azure
# Script detail sourced from "https://github.com/soumukhe/azure_cAPIC-Terraform_Deploy/blob/main/azcapic.sh"
# Recommended reading "https://unofficialaciguide.com/2022/04/18/deploying-capic-on-azure-with-terraform/#ref"
#

resourceGroup="cnc-infra"

az group delete --name $resourceGroup

echo "Remove Contributor IAM assignment in Portal for Cleanup"
