output "api_url" {
  value = google_cloud_run_service.api_server.status[0].url
}
