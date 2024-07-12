output "batch_job_url" {
  value = google_cloud_run_service.batch_job.status[0].url
}
