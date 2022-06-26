resource "docker_image" "linuxserver_transmission" {
  name = "lscr.io/linuxserver/transmission"
}

resource "docker_image" "linuxserver_jackett" {
  name = "lscr.io/linuxserver/jackett"
}

resource "docker_image" "bubuntux_nordlynx" {
  name = "ghcr.io/bubuntux/nordlynx"
}

resource "docker_image" "linuxserver_sonarr" {
  name = "lscr.io/linuxserver/sonarr"
}

resource "docker_image" "linuxserver_radarr" {
  name = "lscr.io/linuxserver/radarr"
}
