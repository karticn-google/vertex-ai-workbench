#!/bin/bash
####################################################################################
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     https://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
####################################################################################

####################################################################################
# README
#
# This script will delete all the Terraform lock and state files
# This will reset Terraform and you will need to run a "source deploy.sh" again which will create a new project and deploy resources
# GCP Project created in the previous run can be deleted using the command "gcloud projects delete PROJECT_ID_OR_NUMBER"
# Author: Kartic Narayanan
# Terraform for Google: https://registry.terraform.io/providers/hashicorp/google/latest/docs
####################################################################################

rm -r ./terraform/.terraform
rm ./terraform/.terraform.lock.hcl
rm ./terraform/terraform.tfstate
rm ./terraform/terraform.tfstate.backup