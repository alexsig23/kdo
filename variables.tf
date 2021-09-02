variable "project" {}

variable "credentials_file" {}

variable "region" {
  default = "eu-central1"
}

variable "zone" {
  default = "eu-central1-a"
}

variable "cluster_name" {
  default = "animals-mongo"
}

variable "cluster_type" {
  default = "mongodbatlas_cluster"
}

variable "database" {
  default = "marsupials-dev"
}

variable "publickey" {
  default = "XXXExample"
}

variable "privatekey" {
  default = "XXXExample"
}