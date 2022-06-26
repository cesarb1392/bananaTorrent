locals {
  enable_jackett      = true
  enable_transmission = true
  enable_sonarr       = true
  enable_radarr       = true
}

resource "docker_container" "transmission" {
  count = local.enable_transmission ? 1 : 0

  name = "transmission"

  image   = docker_image.linuxserver_transmission.latest
  restart = "on-failure"

  env = [
    "PUID=${var.PUID}",
    "PGID=${var.PGID}",
    "TZ=${var.TIMEZONE}",
    "AUTO_UPDATE=true",
  ]

  volumes {
    host_path      = "${var.HOST_PATH}/config/transmission"
    container_path = "/config"
  }
  volumes {
    host_path      = "${var.HOST_PATH}/downloads"
    container_path = "/downloads"
  }
  volumes {
    host_path      = "${var.HOST_PATH}/downloads/watch"
    container_path = "/watch"
  }

  log_driver = "json-file"
  log_opts = {
    max-size = "10m"
    max-file = "3"
  }

  network_mode = "container:${docker_container.bubuntux_nordlynx.0.name}"
  depends_on   = [docker_container.bubuntux_nordlynx]

}

resource "docker_container" "jackett" {
  count = local.enable_jackett ? 1 : 0

  name = "jackett"

  image   = docker_image.linuxserver_jackett.latest
  restart = "on-failure"
  env = [
    "PUID=${var.PUID}",
    "PGID=${var.PGID}",
    "TZ=${var.TIMEZONE}",
    "AUTO_UPDATE=true",
  ]

  volumes {
    host_path      = "${var.HOST_PATH}/downloads/incomplete"
    container_path = "/downloads"
  }
  volumes {
    host_path      = "${var.HOST_PATH}/config/jackett"
    container_path = "/config"
  }
  volumes {
    host_path      = "${var.HOST_PATH}/config/Jackett/Indexers"
    container_path = "/config/Jackett/Indexers"
  }

  network_mode = "container:${docker_container.bubuntux_nordlynx.0.name}"
  depends_on   = [docker_container.bubuntux_nordlynx]
}

resource "docker_container" "sonarr" {
  count = local.enable_sonarr ? 1 : 0

  name = "sonarr"

  image   = docker_image.linuxserver_sonarr.latest
  restart = "on-failure"
  env = [
    "PUID=${var.PUID}",
    "PGID=${var.PGID}",
    "TZ=${var.TIMEZONE}",
  ]

  volumes {
    host_path      = "${var.HOST_PATH}/config/sonarr"
    container_path = "/config"
  }

  volumes {
    host_path      = "${var.HOST_PATH}/downloads/incomplete"
    container_path = "/downloads"
  }

  network_mode = "container:${docker_container.bubuntux_nordlynx.0.name}"
  depends_on   = [docker_container.bubuntux_nordlynx]
}

resource "docker_container" "radarr" {
  count = local.enable_radarr ? 1 : 0

  name = "radarr"

  image   = docker_image.linuxserver_radarr.latest
  restart = "on-failure"
  env = [
    "PUID=${var.PUID}",
    "PGID=${var.PGID}",
    "TZ=${var.TIMEZONE}",
  ]

  volumes {
    host_path      = "${var.HOST_PATH}/config/radarr"
    container_path = "/config"
  }

  volumes {
    host_path      = "${var.HOST_PATH}/downloads/incomplete"
    container_path = "/downloads"
  }

  network_mode = "container:${docker_container.bubuntux_nordlynx.0.name}"
  depends_on   = [docker_container.bubuntux_nordlynx]
}
