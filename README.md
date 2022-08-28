# Banana - Torrent(e)

The name says it all.. this is an automated torrent client that runs behind a wireguard vpn

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| curl | 1.0.2 |
| docker | 2.16.0 |

## Providers

| Name | Version |
|------|---------|
| curl | 1.0.2 |
| docker | 2.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_container.bubuntux_nordlynx](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/container) | resource |
| [docker_container.jackett](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/container) | resource |
| [docker_container.prowlarr](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/container) | resource |
| [docker_container.radarr](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/container) | resource |
| [docker_container.sonarr](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/container) | resource |
| [docker_container.transmission](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/container) | resource |
| [docker_image.bubuntux_nordlynx](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |
| [docker_image.linuxserver_jackett](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |
| [docker_image.linuxserver_prowlarr](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |
| [docker_image.linuxserver_radarr](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |
| [docker_image.linuxserver_sonarr](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |
| [docker_image.linuxserver_transmission](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |
| [curl_curl.get_servers_countries](https://registry.terraform.io/providers/anschoewe/curl/1.0.2/docs/data-sources/curl) | data source |
| [curl_curl.get_vpn_servers](https://registry.terraform.io/providers/anschoewe/curl/1.0.2/docs/data-sources/curl) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| CONFIG\_PATH | n/a | `string` | n/a | yes |
| DOWNLOADS\_PATH | n/a | `string` | n/a | yes |
| NETWORK\_CIDR | n/a | `string` | n/a | yes |
| NORDVPN\_PRIVATE\_KEY | n/a | `string` | n/a | yes |
| PGID | n/a | `number` | n/a | yes |
| PUID | n/a | `number` | n/a | yes |
| TIMEZONE | n/a | `string` | n/a | yes |
| ssh\_profile | n/a | `string` | `""` | no |
| vpn\_country\_code | The code of the country, possible values: "https://api.nordvpn.com/v1/servers/countries" | `string` | `"ES"` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_server\_hostname | n/a |
<!-- END_TF_DOCS -->
