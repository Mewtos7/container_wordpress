locals {
  docker_node1_name = "${local.env}-${local.project}-dockernode01"
  project           = "wp"
  env               = var.env
  location          = var.location
}