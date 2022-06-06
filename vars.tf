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

variable "db_deletion_protection" {
  description = "better to be false for stag environment"
  type        = bool
  default     = true
}

// cloud run settings

variable "cloudRun_container_name" {
  type = string
  default = ""
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
  default = ""
}

variable "cloudRun_environment_variable1_value" {
  type = string
  default = ""
}

variable "cloudRun_environment_variable2_name" {
  type = string
  default = ""
}

variable "cloudRun_environment_variable2_value" {
  type = string
  default = ""
}

variable "cloudRun_environment_variable3_name" {
  type = string
  default = ""
}

variable "cloudRun_environment_variable3_value" {
  type = string
  default = ""
}

variable "cloudRun_environment_variable4_name" {
  type = string
  default = ""
}

variable "cloudRun_environment_variable4_value" {
  type = string
  default = ""
}

variable "cloudRun_environment_variable5_name" {
  type = string
  default = ""
}

variable "cloudRun_environment_variable5_value" {
  type = string
  default = ""
}

// cloud sql settings

variable "cloudSQL_name" {
  type = string
  default = "cloudrun-sql"
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
