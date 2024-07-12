resource "google_cloud_run_service" "batch_job" {
  name     = var.batch_job_name
  location = var.region

  template {
    spec {
      containers {
        image = var.batch_job_image
        args  = ["sh", "-c", "echo 'Batch job executed'"]
      }
    }
  }

  traffics {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_scheduler_job" "batch_job_schedule" {
  name        = var.batch_job_schedule_name
  description = "Scheduled job to trigger batch job"
  schedule    = var.schedule
  time_zone   = var.time_zone
  http_target {
    uri         = google_cloud_run_service.batch_job.status[0].url
    http_method = "POST"
    oidc_token {
      service_account_email = var.service_account_email
    }
  }
}
