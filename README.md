# Description
Wordpress CMS Deployment with Terraform on remoite server with mysql database

# Features planned
- Using GitHub workflow:
    - Using terraform to create a suitable docker infrastructure to deploy wordpess, needed services like MySQL database and a reverse proxy
    - Deploy wordpress and MySQL Database service with docker container
    - Configure DNS after deployment as soon as Ip is available
    - Certbot action to validate domain names

# Deployment instrcutions
## Hetzner: Manual deployment with powershell
Manual deployment with powershell script
1. Set environment variable **hcloud_token** and  **SSH_PUBLIC_KEY**
2. cd into repository root
3. Edit ```src/hetzner/terraform.tfvars ``` to your needs
4. Do ```iac/iac_local_deployment.ps1```

## Wordpress Standalone: Local Deployment with bash
With the following commands, a wordpress standalone container is created with persistent mysql & www-root storage.
All commands in the root directory!

1. Define unique key for mounting
```bash
uniqueKey="unique"
mysqlmount="$uniqueKey-wp-mysql"
wwwmount="$uniqueKey-wp-www"
```
2. Create image
```bash
docker build -t my-username/my-image -f src/docker/wordpress_standalone/wpstandalone.dockerfile .
docker run -p 80:80 -v $wwwmount:/var/www -v $mysqlmount:/var/lib/mysql my-username/my-image
```

# Open topics
- (fix)Localization missing after container destroy
- (Add) certbot to container as option, when fqdn is added
- (Add) Workflow for hetzner server creation (included tf destroy)
- (Add) Workflow for container creation & registry push (included tf destroy)