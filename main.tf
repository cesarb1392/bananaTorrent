locals {
  enable_jackett      = true
  enable_transmission = true
}


resource "docker_container" "transmission" {
  count = local.enable_transmission == true ? 1 : 0

  name = "transmission"

  image   = docker_image.linuxserver_transmission.latest
  restart = "always"

  env = [
    "PUID=${var.PUID}",
    "PGID=${var.PGID}",
    "TZ=${var.TIMEZONE}",
    "AUTO_UPDATE=true",
  ]

  network_mode = "container:${docker_container.bubuntux_nordlynx.name}"
  depends_on   = [docker_container.bubuntux_nordlynx]

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

}

resource "docker_container" "jackett" {
  count = local.enable_jackett == true ? 1 : 0

  name = "jackett"

  image   = docker_image.linuxserver_jackett.latest
  restart = "always"
  env = [
    "PUID=${var.PUID}",
    "PGID=${var.PGID}",
    "TZ=${var.TIMEZONE}",
    "AUTO_UPDATE=true",
  ]

  volumes {
    host_path      = "${var.HOST_PATH}/downloads/watch"
    container_path = "/downloads"
  }
  volumes {
    host_path      = "${var.HOST_PATH}/config/jackett"
    container_path = "/config"
  }

  network_mode = "container:${docker_container.bubuntux_nordlynx.name}"
  depends_on   = [docker_container.bubuntux_nordlynx]
}

resource "docker_container" "bubuntux_nordlynx" {
  name = "nordvpn"

  image        = docker_image.bubuntux_nordlynx.latest
  restart      = "always"
  network_mode = "bridge"
  capabilities {
    add = ["NET_ADMIN", "NET_RAW", "SYS_MODULE"]
  }

  env = [
    "PRIVATE_KEY=${var.NORDVPN_PRIVATE_KEY}",
    "NET_LOCAL=${var.NETWORK_CIDR}",
    "TZ=${var.TIMEZONE}",
    "ALLOWED_IPS=0.0.0.0/0",
    "DNS=208.67.222.222,1.1.1.1",
    "END_POINT=${local.json_data[0].hostname}:51820",
    "PUBLIC_KEY=${local.json_data[0].technologies[5].metadata[0].value}"
  ]

  sysctls = {
    "net.ipv6.conf.all.disable_ipv6"   = 1
    "net.ipv4.conf.all.src_valid_mark" = 1
  }

  ports {
    internal = 9091
    external = 8080
  }

  ports {
    internal = 9117
    external = 8081
  }

}
