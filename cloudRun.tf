resource "google_cloud_run_service" "default" {
  name = "test-container"
  location = var.region

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = 1
        "run.googleapis.com/cloudsql-instances" = google_sql_database_instance.instance.connection_name
      }
    }

    spec {
      timeout_seconds = 60

      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"

        env {
          name = "FIRST_ENV"
          value = "first env value"
        }

        env {
          name = "SECOND ENV"
          value = "second env value"
        }

        ports {
          container_port = 8080
        }

        resources {
          limits = {
            cpu = 1
            memory = "256Mi"
          }
        }
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
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
