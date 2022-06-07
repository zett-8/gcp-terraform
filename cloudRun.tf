resource "google_cloud_run_service" "default" {
  name = var.cloudRun_container_name
  location = var.region

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = var.cloudRun_autoScaling_max
        "run.googleapis.com/cloudsql-instances" = google_sql_database_instance.instance.connection_name
      }
    }

    spec {
      timeout_seconds = var.cloudRun_timeout_seconds

      containers {
//        image = "us-docker.pkg.dev/cloudrun/container/hello"
        image = "gcr.io/${var.project_id}/${var.cloudRun_container_name}:latest"

        env {
          name = var.cloudRun_environment_variable1_name
          value = var.cloudRun_environment_variable1_value
        }
        env {
          name = var.cloudRun_environment_variable2_name
          value = var.cloudRun_environment_variable2_value
        }
        env {
          name = var.cloudRun_environment_variable3_name
          value = var.cloudRun_environment_variable3_value
        }
        env {
          name = var.cloudRun_environment_variable4_name
          value = var.cloudRun_environment_variable4_value
        }
        env {
          name = var.cloudRun_environment_variable5_name
          value = var.cloudRun_environment_variable5_value
        }

        ports {
          container_port = var.cloudRun_container_port
        }

        resources {
          limits = {
            cpu = var.cloudRun_cpu_limit
            memory = var.cloudRun_memory_limit
          }
        }
      }
    }
  }

  traffic {
    percent = var.cloudRun_traffic_percent
    latest_revision = var.cloudRun_latest_revision
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
