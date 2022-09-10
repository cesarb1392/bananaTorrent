terraform {
  required_version = ">= 1.2.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.20.3"
    }
    curl = {
      source  = "anschoewe/curl"
      version = "1.0.2"
    }
  }
}

locals {
  is_local = true

  docker_host = local.is_local == true ? "unix:///var/run/docker.sock" : "ssh://${var.ssh_profile}"
  ssh_opts    = local.is_local == false ? ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"] : []
}


provider "docker" {
  host     = local.docker_host
  ssh_opts = local.ssh_opts
}


provider "curl" {}

