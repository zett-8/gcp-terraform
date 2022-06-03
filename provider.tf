terraform {
  cloud {
    organization = "zett-8"

    workspaces {
      name = "gcp-terraform"
    }
  }

  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">=3.5.0"
    }
  }
}

provider "google" {
  credentials = file(var.credential_filename)

  project     = var.project_id
  region      = var.region
  zone        = var.zone
}
