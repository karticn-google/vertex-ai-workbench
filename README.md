# Vertex AI Workbench
- This script will use **bash** to deploy the code
- A new GCP project will be created as part of this Terraform execution
#### Steps for Deployment are as follows:
1. Open **Cloudshell** in Google Cloud Console
2. Run the following commands once the cloud shell is up and running
	- `gcloud auth login` and follow the prompts to authorize
    - `gcloud auth application-default login` and follow the prompts to authorize
3. Navigate to vertex-ai-workbench folder and run the command `source deploy.sh` which will execute the deploy.sh
4. Follow the prompts which will continue with the terraform deployment
5. This script needs an admin login so that the project and a service account can be created in the terraform script

#### Steps for Cleanup are as follows:
This section is TBD. Until finalized, if you execute the cleanup.sh, following files will be cleaned up in the `vertex-ai-workbench/terraform/` folder:
1. `./terraform/.terraform`
2. `./terraform/.terraform.lock.hcl`
3. `./terraform/terraform.tfstate`
4. `./terraform/terraform.tfstate.backup`

> Note: The Post Start up script in this repository `scripts/notebook-startup.sh` will clone the following repository [Vertex AI MLOps by statmike](https://github.com/statmike/vertex-ai-mlops.git)
 which will contain sample notebooks.
> GCP Project created in the previous run can be deleted using the command "gcloud projects delete PROJECT_ID_OR_NUMBER"
