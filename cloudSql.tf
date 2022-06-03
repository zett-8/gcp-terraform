resource "google_sql_database_instance" "instance" {
  name             = "cloudrun-sql"
  region           = var.region
  database_version = "POSTGRES_14"

  settings {
    tier = "db-f1-micro"
    availability_type = "ZONAL" // high availability (REGIONAL) or single zone (ZONAL).
    disk_autoresize = true
    disk_type = "PD_SSD" // PD_SSD or PD_HDD
    disk_size = 10

    backup_configuration {
      enabled = true
      point_in_time_recovery_enabled = true
    }
  }

  deletion_protection  = var.db_deletion_protection
}

resource "google_sql_user" "users" {
  name     = "admin"
  instance = google_sql_database_instance.instance.name
  password = "postgres"
}
