# Create a new server running ubuntu
resource "hcloud_server" "docker_node1" {
  name        = local.docker_node1_name
  image       = "ubuntu-24.04"
  location    = local.location
  server_type = "cx22"
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  ssh_keys  = [hcloud_ssh_key.default.id]
  user_data = file("config.yaml")
}