provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
  zone        = var.zone
}


terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "0.9.1"
    }
  }
}

resource "random_password" "userpassword" {
  length      = 22
  min_lower   = 5
  min_special = 4
  special     = true
}

resource "mongodbatlas_database_user" "config" {
  username           = "dev_user"
  password           = random_password.userpassword.result
  project_id         = var.project
  auth_database_name = "admin"

  roles {
    role_name       = "read"
    database_name   = var.database
    collection_name = "possums"
  }

  roles {
    role_name       = "read"
    database_name   = var.database
    collection_name = "numbats"
  }
  roles {
    role_name       = "read"
    database_name   = "marsupials-prod"
    collection_name = "numbats"
  }

}
output "user_outputs" {
  value     = mongodbatlas_database_user.config
  sensitive = true
}