resource "google_sql_database_instance" "instance" {
  name             = var.cloudSQL_name
  region           = var.region
  database_version = var.cloudSQL_database_version

  settings {
    tier = var.cloudSQL_tier
    availability_type = var.cloudSQL_availability_type
    disk_autoresize = var.cloudSQL_auto_resize
    disk_type = var.cloudSQL_disk_type
    disk_size = var.cloudSQL_disk_size

    backup_configuration {
      enabled = var.cloudSQL_backup_enable
      point_in_time_recovery_enabled = var.cloudSQL_point_in_time_recovery
    }
  }

  deletion_protection  = var.db_deletion_protection
}

resource "google_sql_user" "users" {
  name     = var.cloudSQL_user_name
  instance = google_sql_database_instance.instance.name
  password = var.cloudSQL_user_password
}
