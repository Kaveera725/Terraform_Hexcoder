resource "google_artifact_registry_repository" "registry" {
  location      = "asia-south1"
  repository_id = "docker-demo"
  format        = "DOCKER"
}

resource "docker_image" "terraform-demo" {
  name = "asia-south1-docker.pkg.dev/hexcoder-docker-demo-487011/docker-demo/terraform-demo:latest"
  build {
    context = "../src/"
    tag     = ["asia-south1-docker.pkg.dev/hexcoder-docker-demo-487011/docker-demo/terraform-demo:latest"]
  }
  depends_on = [google_artifact_registry_repository.registry]
}

resource "docker_registry_image" "terraform-demo" {
  name          = docker_image.terraform-demo.name
  keep_remotely = true
}