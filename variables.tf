variable "NETWORK_CIDR" {
  type = string
}

variable "HOST_PATH" {
  type = string
}

variable "PUID" {
  type = number
}

variable "PGID" {
  type = number
}

variable "TIMEZONE" {
  type = string
}

variable "NORDVPN_PRIVATE_KEY" {
  type = string
}

variable "vpn_country_code" {
  type        = string
  default     = "ES"
  description = "The code of the country, possible values: \"https://api.nordvpn.com/v1/servers/countries\""
}

variable "ssh_profile" {
  type    = string
  default = ""
}
