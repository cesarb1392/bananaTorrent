variable "OPENVPN_PROVIDER" {
  type    = string
  default = "NORDVPN"
}

variable "OPENVPN_CONFIG" {
  type = string
}

variable "OPENVPN_USERNAME" {
  type = string
}

variable "OPENVPN_PASSWORD" {
  type = string
}

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
