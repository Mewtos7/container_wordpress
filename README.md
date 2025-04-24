# Description
Wordpress CMS Deployment with mysql database

# Deployment instructions

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
docker build -t my-username/my-image -f src/docker/wordpress_standalone/wpstandalone.dockerfile src/docker/wordpress_standalone/
```

3. Run Image without domain
```bash
docker run -p 80:80 -v $wwwmount:/srv/www -v $mysqlmount:/var/lib/mysql my-username/my-image
```

4. Run Image with domain and ssl
Therefore, you need to create a DNS-Record (A or AAA) for www.yourdomain and yourdomain
```bash
docker run -p 80:80 -p 443:443 -v $wwwmount:/srv/www -v $mysqlmount:/var/lib/mysql -e DOMAIN='test.com' -e MAIL='testmail@test.com' my-username/my-image --restart always
```


# Open topics
- (Add) Container tests for startup
- (Add) Semantic releases and upload as github package