resource "docker_image" "linuxserver_transmission" {
  name = "lscr.io/linuxserver/transmission"
}

resource "docker_image" "linuxserver_jackett" {
  name = "lscr.io/linuxserver/jackett"
}

resource "docker_image" "bubuntux_nordlynx" {
  name = "ghcr.io/bubuntux/nordlynx"
}
