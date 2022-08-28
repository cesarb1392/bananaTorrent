locals {
  server_country_selected = {
    for k, v in jsondecode(data.curl.get_servers_countries.response) : var.vpn_country_code => v.id
    if(v.code == var.vpn_country_code)
  }
  base_vpn_servers_uri = "https://api.nordvpn.com/v1/servers/recommendations?&filters[servers_technologies][identifier]=wireguard_udp&limit=1"
  vpn_servers_uri      = format("${local.base_vpn_servers_uri}%s", contains(keys(local.server_country_selected), var.vpn_country_code) ? "&filters[country_id]=${values(local.server_country_selected).0}" : "")
  vpc_server           = jsondecode(data.curl.get_vpn_servers.response)
}

data "curl" "get_servers_countries" {
  http_method = "GET"
  uri         = "https://api.nordvpn.com/v1/servers/countries"
}

data "curl" "get_vpn_servers" {
  http_method = "GET"
  uri         = local.vpn_servers_uri
}

resource "docker_container" "bubuntux_nordlynx" {
  count = local.enable_transmission ? 1 : 0

  name = "nordvpn-transmission"

  image        = docker_image.bubuntux_nordlynx.latest
  restart      = "on-failure"
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
    "END_POINT=${local.vpc_server[0].hostname}:51820",
    "PUBLIC_KEY=${local.vpc_server[0].technologies[5].metadata[0].value}"
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

  ports {
    internal = 8989
    external = 8082
  }

  ports {
    internal = 7878
    external = 8083
  }

  ports {
    internal = 9696
    external = 8084
  }

}
