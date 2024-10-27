# Description
Wordpress CMS Deployment with Terraform on remoite server with mysql database

# Features planned
- Using GitHub workflow:
    - Using terraform to create a suitable docker infrastructure to deploy wordpess, needed services like MySQL database and a reverse proxy
    - Deploy wordpress and MySQL Database service with docker container
    - Configure DNS after deployment as soon as Ip is available
    - Certbot action to validate domain names

# Hetzner: Manual deployment
Manual deployment with powershell script
1. Set environment variable **hcloud_token**
2. cd into repository root
3. Do ```common/iac_local_deployment.ps1```