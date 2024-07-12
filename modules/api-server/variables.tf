variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "The region to deploy the API server"
  default     = "us-central1"
}

variable "api_server_name" {
  type        = string
  description = "The name of the Cloud Run service"
}

variable "api_image" {
  type        = string
  description = "The Docker image for the API server"
}
