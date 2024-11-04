# Environment name
variable "env" {
  type = string
}

# Location
variable "location" {
  type = string
}

# API Token
variable "hcloud_token" {
  type      = string
  sensitive = true
}

# Public SSH Key
variable "ssh_key" {
  type      = string
  sensitive = true
}