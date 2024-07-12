resource "google_cloud_run_service" "api_server" {
  name     = var.api_server_name
  location = var.region

  template {
    spec {
      containers {
        image = var.api_image
        ports {
          container_port = 80
        }
      }
    }
  }

  traffics {
    percent         = 100
    latest_revision = true
  }
}

resource "google_project_iam_member" "cloud_run_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "allUsers"
}
