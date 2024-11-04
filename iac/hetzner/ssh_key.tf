# Create a new SSH key
resource "hcloud_ssh_key" "default" {
  name       = "Terraform Key"
  public_key = var.ssh_key
}