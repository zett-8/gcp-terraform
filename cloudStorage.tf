resource "google_storage_bucket" "bucket" {
  project       = var.project_id
  name          = var.cloudStorage_bucket_name
  location      = var.cloudStorage_location
  force_destroy = var.cloudStorage_force_destroy

  storage_class = var.cloudStorage_storage_class
  uniform_bucket_level_access = var.cloudStorage_uniform_access

  cors {
    origin          = var.cloudStorage_cors_origin
    method          = var.cloudStorage_cors_method
    response_header = var.cloudStorage_cors_response_header
    max_age_seconds = var.cloudStorage_cors_max_age_seconds
  }
}

data "google_iam_policy" "viewer" {
  binding {
    role = "roles/storage.objectViewer"
    members = [
        "allUsers",
    ]
  }
}

resource "google_storage_bucket_iam_policy" "editor" {
  bucket = google_storage_bucket.bucket.name
  policy_data = data.google_iam_policy.viewer.policy_data
}
