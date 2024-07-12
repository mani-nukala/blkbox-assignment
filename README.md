# GCP API Server and Batch Job Deployment

## Pre-requisites

- A GCP account with a project set up.
- Billing enabled for your GCP project.
- Enable the following APIs in your GCP project:
  - Cloud Run API
  - Cloud Scheduler API
  - IAM API
  - Compute Engine API
- A service account with the necessary permissions, and its key file downloaded.
- Terraform installed on your local machine.

## How to Use

1. Clone the repository to your local machine.
2. Set the `GOOGLE_APPLICATION_CREDENTIALS` environment variable to point to your service account key file:
   ```sh
   export GOOGLE_APPLICATION_CREDENTIALS="path/to/your/service-account-key.json"

## Terraform Deployment 
 Navigate to Infra folder ( `cd blkbox-assignment/infra/` ) then excecute the following commands

1. terraform init
2. terraform validate
3. terraform plan
4. terraform apply