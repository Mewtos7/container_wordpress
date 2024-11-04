# Powershell for local test iac deployment

## Set hcloud_token before with $HCLOUD_TOKEN = "TOKEN-HERE"
## Set ssh key before with $SSH_PUBLIC_KEY = "Key-HERE"
terraform -chdir=hetzner fmt
terraform -chdir=hetzner init
terraform -chdir=hetzner plan  -var-file="local.terraform.tfvars" -var="hcloud_token=${HCLOUD_TOKEN}" -var="ssh_key=${SSH_PUBLIC_KEY}"
terraform -chdir=hetzner validate
terraform -chdir=hetzner apply -var-file="local.terraform.tfvars" -var="hcloud_token=${HCLOUD_TOKEN}" -var="ssh_key=${SSH_PUBLIC_KEY}" --auto-approve