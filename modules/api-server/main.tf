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

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_binding" "cloud_run_invoker" {
  project = var.project_id
  location = google_cloud_run_service.api_server.location
  service  = google_cloud_run_service.api_server.name
  role    = "roles/run.invoker"
  members  = ["allUsers"]
}
