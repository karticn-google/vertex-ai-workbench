
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
# Author: Kartic Narayanan
####################################################################################

# Get the account name who logged in above 
gcp_account_name=$(gcloud auth list --filter=status:ACTIVE --format="value(account)")


# Get the Org Id (required for org policies and creating the GCP project)
org_id=$(gcloud organizations list --format="value(name)")
if [ -z "${org_id}" ]
then
  echo "Org Id could not be automatically read."
  echo "Open this link: https://console.cloud.google.com/cloud-resource-manager/ and copy your org id."
  echo "Your org id will be in the format of xxxxxxxxxxxx"
  read -p "Please enter your org id:" org_id
else
  org_id_length=$(echo -n "${org_id}" | wc -m)
  org_id_length_int=$(expr ${org_id_length} + 0)
  if [ ${org_id_length_int} != 12 ]
  then
    echo "You have more than one org id, please manually enter the correct one."
    echo "Your org id will be in the format of xxxxxxxxxxxx"
    read -p "Please enter your org id:" org_id
  else
    echo "Org Id was automatically retreived."
  fi
fi

# Get the Billing Account (required for creating the GCP project)
billing_account=$(gcloud beta billing accounts list --format="value(ACCOUNT_ID)")
if [ -z "${billing_account}" ]
then
  echo "Billing Account could not be automatically read."
  echo "Open this link: https://console.cloud.google.com/billing/ and copy your billing account."
  echo "Your billing account will be in the format of xxxxxx-xxxxxx-xxxxxx"
  read -p "Please enter your billing account:" billing_account
else
  billing_account_length=$(echo -n "${billing_account}" | wc -m)
  billing_account_length_int=$(expr ${billing_account_length} + 0)
  if [ ${billing_account_length_int} != 20 ]
  then
    echo "You have more than one billing account, please manually enter the correct one."
    echo "Your billing account will be in the format of xxxxxx-xxxxxx-xxxxxx"
    read -p "Please enter your billing account:" billing_account
  else
    echo "Billing Account was automatically retreived."
  fi
fi



echo "gcp_account_name: ${gcp_account_name}"
echo "billing_account:  ${billing_account}"
echo "org_id:           ${org_id}"


echo "*********************************************************"
read -p "Press [Enter] key if all the above items are set (gcp_account_name, org_id, billing_account). If not press Ctrl+C ..."
echo "*********************************************************"


####################################################################################
# Deploy Terraform
####################################################################################
currentDir=$(pwd -P)
export TF_LOG=INFO
export TF_LOG_PATH="${currentDir}/tf.log"

cd "./terraform"

# Initialize Terraform
terraform init


echo "terraform plan -var=\"org_id=${org_id}\" -var=\"billing_account=${billing_account}\""

# Run the Terraform Plan
terraform plan \
  -var="org_id=${org_id}" \
  -var="billing_account=${billing_account}"


# Validate
terraform validate

echo "terraform apply -var=\"org_id=${org_id}\" -var=\"billing_account=${billing_account}\" -auto-approve"

# Run the Terraform Apply
terraform apply \
  -var="org_id=${org_id}" \
  -var="billing_account=${billing_account}" \
  -auto-approve


echo "******Terraform Deployment Completed Successfully******"
