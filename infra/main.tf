provider "google" {
  project = var.project_id
  region  = var.region
}

module "api_server" {
  source          = "../modules/api-server"
  project_id      = var.project_id
  region          = var.region
  api_server_name = var.api_server_name
  api_image       = var.api_image
}

module "batch_job" {
  source                  = "../modules/batch-job"
  project_id              = var.project_id
  region                  = var.region
  batch_job_name          = var.batch_job_name
  batch_job_image         = var.batch_job_image
  batch_job_schedule_name = var.batch_job_schedule_name
  schedule                = var.schedule
  time_zone               = var.time_zone
  service_account_email   = var.service_account_email
}

resource "google_project_iam_member" "scheduler_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${var.service_account_email}"
}
