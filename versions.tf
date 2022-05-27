terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}


provider "docker" {
  # cane be used ssh/config hostname or directly user@remote-host:22
  host     = "ssh://astorgaBanana"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

