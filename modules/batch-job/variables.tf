variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "The region to deploy the batch job"
  default     = "us-central1"
}

variable "batch_job_name" {
  type        = string
  description = "The name of the Cloud Run service for the batch job"
}

variable "batch_job_image" {
  type        = string
  description = "The Docker image for the batch job"
}

variable "batch_job_schedule_name" {
  type        = string
  description = "The name of the Cloud Scheduler job"
}

variable "schedule" {
  type        = string
  description = "The schedule in cron format"
}

variable "time_zone" {
  type        = string
  description = "The time zone for the schedule"
}

variable "service_account_email" {
  type        = string
  description = "The service account email to trigger the batch job"
}
