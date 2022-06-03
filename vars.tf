variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "central-embassy-352211"
}

variable "region" {
  description = "Specify a region e.g. 'europe-west3'"
  type        = string
  default     = "europe-west3"
}

variable "zone" {
  description = "Specify a zone e.g. 'europe-west3-a'"
  type        = string
  default     = "europe-west3-a"
}

variable "credential_filename" {
  description = "Download json from GCP -> service account -> keys and put in the same directly"
  type        = string
  default     = "gcp-sa.json"
}
