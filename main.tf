locals {
  enable_jackett      = true
  enable_transmission = true
  enable_sonarr       = false
  enable_radarr       = false
  enable_prowlarr     = false
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
    host_path      = "${var.CONFIG_PATH}/transmission"
    container_path = "/config"
  }
  volumes {
    host_path      = var.DOWNLOADS_PATH
    container_path = "/downloads"
  }
  volumes {
    host_path      = "${var.DOWNLOADS_PATH}/watch"
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
    host_path      = "${var.DOWNLOADS_PATH}/incomplete"
    container_path = "/downloads"
  }
  volumes {
    host_path      = "${var.CONFIG_PATH}/jackett"
    container_path = "/config"
  }
  volumes {
    host_path      = "${var.CONFIG_PATH}/Jackett/Indexers"
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
    host_path      = "${var.CONFIG_PATH}/sonarr"
    container_path = "/config"
  }

  volumes {
    host_path      = "${var.DOWNLOADS_PATH}/incomplete"
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
    host_path      = "${var.CONFIG_PATH}/radarr"
    container_path = "/config"
  }

  volumes {
    host_path      = "${var.DOWNLOADS_PATH}/incomplete"
    container_path = "/downloads"
  }

  network_mode = "container:${docker_container.bubuntux_nordlynx.0.name}"
  depends_on   = [docker_container.bubuntux_nordlynx]
}


resource "docker_container" "prowlarr" {
  count = local.enable_prowlarr ? 1 : 0

  name = "prowlarr"

  image   = docker_image.linuxserver_prowlarr.latest
  restart = "on-failure"
  env = [
    "PUID=${var.PUID}",
    "PGID=${var.PGID}",
    "TZ=${var.TIMEZONE}",
  ]

  volumes {
    host_path      = "${var.CONFIG_PATH}/prowlarr"
    container_path = "/config"
  }

  network_mode = "container:${docker_container.bubuntux_nordlynx.0.name}"
  depends_on   = [docker_container.bubuntux_nordlynx]
}
