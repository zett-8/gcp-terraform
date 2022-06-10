// common settings

variable "project_id" {
  description = "GCP project ID"
  type        = string
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
}

// cloud run settings

variable "cloudRun_container_name" {
  type = string
}

variable "cloudRun_autoScaling_max" {
  type = number
  default = 1
}

variable "cloudRun_timeout_seconds" {
  type = number
  default = 60
}

variable "cloudRun_container_port" {
  type = number
  default = 8080
}

variable "cloudRun_cpu_limit" {
  type = number
  default = 1
}

variable "cloudRun_memory_limit" {
  type = string
  default = "256Mi"
}

variable "cloudRun_traffic_percent" {
  type = number
  default = 100
}

variable "cloudRun_latest_revision" {
  type = bool
  default = true
}

variable "cloudRun_environment_variable1_name" {
  type = string
  default = "KEY1"
}

variable "cloudRun_environment_variable1_value" {
  type = string
  default = "VALUE1"
}

variable "cloudRun_environment_variable2_name" {
  type = string
  default = "KEY2"
}

variable "cloudRun_environment_variable2_value" {
  type = string
  default = "VALUE2"
}

variable "cloudRun_environment_variable3_name" {
  type = string
  default = "KEY3"
}

variable "cloudRun_environment_variable3_value" {
  type = string
  default = "VALUE3"
}

variable "cloudRun_environment_variable4_name" {
  type = string
  default = "KEY4"
}

variable "cloudRun_environment_variable4_value" {
  type = string
  default = "VALUE4"
}

variable "cloudRun_environment_variable5_name" {
  type = string
  default = "KEY5"
}

variable "cloudRun_environment_variable5_value" {
  type = string
  default = "VALUE5"
}

// cloud sql settings

variable "cloudSQL_name" {
  type = string
  default = "cloud-sql"
}

variable "cloudSQL_database_version" {
  type = string
  default = "POSTGRES_14"
}

variable "cloudSQL_tier" {
  type = string
  default = "db-f1-micro"
}

variable "cloudSQL_availability_type" {
  description = "high availability (REGIONAL) or single zone (ZONAL)."
  type = string
  default = "REGIONAL"
}

variable "cloudSQL_auto_resize" {
  type = bool
  default = true
}

variable "cloudSQL_disk_type" {
  description = "PD_SSD or PD_HDD"
  type = string
  default = "PD_SSD"
}

variable "cloudSQL_disk_size" {
  type = number
  default = 10
}

variable "cloudSQL_backup_enable" {
  type = bool
  default = true
}

variable "cloudSQL_point_in_time_recovery" {
  type = bool
  default = true
}

variable "cloudSQL_user_name" {
  type = string
  default = "postgres"
}

variable "cloudSQL_user_password" {
  type = string
  default = "postgrespassword"
}

variable "cloudSQL_deletion_protection" {
  description = "better to be false for stag environment"
  type        = bool
  default     = true
}

variable "cloudSQL_user_deletion_policy" {
  type = string
  default = "ABANDON"
}

// cloud storage settings

variable "cloudStorage_bucket_name" {
  type = string
  default = "bucket_name"
}

variable "cloudStorage_location" {
  type = string
  description = "to deploy in multiple region, select from 'eu', 'us' and 'asia'"
  default = "eu"
}

variable "cloudStorage_force_destroy" {
  type = bool
  default = false
}

variable "cloudStorage_storage_class" {
  type = string
  default = "STANDARD"
}

variable "cloudStorage_uniform_access" {
  type = bool
  default = true
}

variable "cloudStorage_cors_origin" {
  type = list(string)
  default = ["*"]
}

variable "cloudStorage_cors_method" {
  type = list(string)
  default = ["GET", "HEAD", "PUT", "POST", "DELETE"]
}

variable "cloudStorage_cors_response_header" {
  type = list(string)
  default = ["*"]
}

variable "cloudStorage_cors_max_age_seconds" {
  type = number
  default = 3600
}
