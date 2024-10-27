# Powershell for local test iac deployment

## Set hcloud_token before with $hcloud_token = "TOKEN-HERE"
cd ..
cd src/hetzner
terraform fmt
terraform init
terraform plan -var-file="local.terraform.tfvars" -var="hcloud_token=${hcloud_token}"
terraform validate
terraform apply -var-file="local.terraform.tfvars" -var="hcloud_token=${hcloud_token}" --auto-approve