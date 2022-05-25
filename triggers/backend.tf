terraform {
  #required_version = "0.12.29"
  required_providers {
    /*google = {
      source  = "hashicorp/google"
      version = "<4.0,>= 2.12"
    }*/
    /*google-beta = {
      source = "hashicorp/google-beta"
    }*/
  }
  /*backend "gcs" {
    bucket = "tf-state-canary"
    prefix = "terraform/state/triggers"
  }*/
}
provider "google" {
  project = var.project_id
  region  = var.region
}
provider "google-beta" {
  project = var.project_id
  region  = var.region
}
