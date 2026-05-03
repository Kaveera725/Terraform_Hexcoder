terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.30.0"
    }
    
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.2.0"
    }
  }
  }

  provider "google" {
  project = "hexcoder-docker-demo-487011"
  region  = "asia-south1"
}

data "google_client_config" "default" {}

provider "docker" {
  registry_auth {
    address  = "asia-south1-docker.pkg.dev"
    username = "oauth2accesstoken"
    password = data.google_client_config.default.access_token
  }
}