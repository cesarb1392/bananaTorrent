# Banana - Torrente

```shell
 docker exec -it transmission curl ifconfig.me -vv

 docker exec -it jackett curl ifconfig.me -vv
 
 docker exec -it nordvpn curl icanhazip.com -vv
```

> how to get your `NORDVPN_PRIVATE_KEY`?
```shell
    docker run --rm --cap-add=NET_ADMIN -e USER=XXX -e PASS=YYY bubuntux/nordvpn:get_private_key
```

> how to get nordvpn recommended servers?
```shell
    curl -s "https://api.nordvpn.com/v1/servers/recommendations?&filters\[servers_technologies\]\[identifier\]=wireguard_udp&limit=1"|jq -r '.[]|.hostname, .station, (.locations|.[]|.country|.city.name), (.locations|.[]|.country|.name), (.technologies|.[].metadata|.[].value), .load'
```

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
| [docker_container.transmission](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/container) | resource |
| [docker_image.bubuntux_nordlynx](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |
| [docker_image.linuxserver_jackett](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |
| [docker_image.linuxserver_transmission](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |
| [curl_curl.get_vpn_servers](https://registry.terraform.io/providers/anschoewe/curl/1.0.2/docs/data-sources/curl) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| HOST\_PATH | n/a | `string` | n/a | yes |
| NETWORK\_CIDR | n/a | `string` | n/a | yes |
| NORDVPN\_PRIVATE\_KEY | n/a | `string` | n/a | yes |
| PGID | n/a | `number` | n/a | yes |
| PUID | n/a | `number` | n/a | yes |
| TIMEZONE | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_server\_hostname | n/a |        
<!-- END_TF_DOCS -->
