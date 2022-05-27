resource "docker_container" "transmission" {
  name = "transmission"

  image   = docker_image.transmission_vpn.latest
  restart = "always"
  capabilities {
    add = ["NET_ADMIN"]
  }

  env = [
    "OPENVPN_PROVIDER=${var.OPENVPN_PROVIDER}",
    "OPENVPN_CONFIG=${var.OPENVPN_CONFIG}",
    "OPENVPN_USERNAME=${var.OPENVPN_USERNAME}",
    "OPENVPN_PASSWORD=${var.OPENVPN_PASSWORD}",
    "LOCAL_NETWORK=${var.NETWORK_CIDR}",
  ]

  ports {
    internal = 9091
    external = 9091
  }

  volumes {
    host_path      = "${var.HOST_PATH}/transmission"
    container_path = "/data"
  }

  log_driver = "json-file"
  log_opts = {
    max-size = "10m"
    max-file = "3"
  }

  depends_on = [docker_image.transmission_vpn]
}

resource "docker_container" "jackett" {
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
    host_path      = "${var.HOST_PATH}/downloads"
    container_path = "/downloads"
  }
  volumes {
    host_path      = "${var.HOST_PATH}/config"
    container_path = "/config"
  }

  ports {
    internal = 9117
    external = 9117
  }

  depends_on = [docker_image.linuxserver_jackett]
}
