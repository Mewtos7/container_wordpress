locals {
  docker_node1_name = "${local.env}-${local.project}-dockernode1"
  project           = "wp"
  env               = var.env
  location          = var.location
}