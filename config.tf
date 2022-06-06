data "curl" "get_vpn_servers" {
  http_method = "GET"
  uri         = "https://api.nordvpn.com/v1/servers/recommendations?&filters[servers_technologies][identifier]=wireguard_udp&limit=1"
}

locals {
  json_data = jsondecode(data.curl.get_vpn_servers.response)
}

