terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.20.0"
    }
  }
  required_version = ">= 1.4.0"
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

resource "docker_container" "web" {
  name  = "tf-nginx"
  image = docker_image.nginx.image_id # ✅ fixed here

  ports {
    internal = 80
    external = var.port
  }

  mounts {
    target    = "/usr/share/nginx/html"
    source    = "C:/Users/Poojitha Motha/Documents/webpage/site"
    type      = "bind"
    read_only = true
  }

  restart = "unless-stopped"
}
