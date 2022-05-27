# Banana - Torrente



<!-- BEGIN_TF_DOCS -->
 ## Requirements

| Name | Version |
|------|---------|
| docker | 2.16.0 |

## Providers

| Name | Version |
|------|---------|
| docker | 2.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_container.jackett](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/container) | resource |
| [docker_container.transmission](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/container) | resource |
| [docker_image.linuxserver_jackett](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |
| [docker_image.transmission_vpn](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| HOST\_PATH | n/a | `string` | n/a | yes |
| NETWORK\_CIDR | n/a | `string` | n/a | yes |
| OPENVPN\_CONFIG | n/a | `string` | n/a | yes |
| OPENVPN\_PASSWORD | n/a | `string` | n/a | yes |
| OPENVPN\_PROVIDER | n/a | `string` | `"NORDVPN"` | no |
| OPENVPN\_USERNAME | n/a | `string` | n/a | yes |
| PGID | n/a | `number` | n/a | yes |
| PUID | n/a | `number` | n/a | yes |
| TIMEZONE | n/a | `string` | n/a | yes |

## Outputs

No outputs.        
<!-- END_TF_DOCS -->
