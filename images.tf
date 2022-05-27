resource "docker_image" "transmission_vpn" {
  name = "haugene/transmission-openvpn"
}

resource "docker_image" "linuxserver_jackett" {
  name = "lscr.io/linuxserver/jackett"
}
