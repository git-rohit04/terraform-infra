

variable "vpn-ip" {
  default     = "10.0.0.0/8"
  description = "VPN IP range"
}

variable "app-ip" {
  default     = "10.0.0.0/8"
}

variable "port1" {
  default     = "443"
}

variable "port2" {
  default     = "80"
}


