# element-dockerized

element-dockerized is an attempt to deploy element stack with docker compose.
Call feature was completely removed. Instead, admin client was added, with custom modifications.
It's featuring:

 * Element Web
 * Element Admin
 * Synapse
 * Matrix Authentication Service
 * nginx.

Reverse proxy to resolve TLS in front of it is required. Simply forward it to nginx port 80.
PostgreSQL must be setup separately, before deploying this project.

## To install

Clone repo:

```sh
git clone --recurse-submodules <repo-url>
```

## To run

 1. Install [Docker Compose](https://docs.docker.com/compose/install/).

Then:

```
./setup.sh

# Point DNS for *.domain at your docker host,
# Or if running on localhost with mkcert:
# source .env; sudo sh -c "echo 127.0.0.1 $DOMAINS >> /etc/hosts"

docker compose up
# go to https://element on your domain.
```


## To configure

Check the .env file, or customise the templates in `/data-templates` and then `docker compose down && docker compose up -d`.

In particular, you may wish to:
 * Point at your own SMTP server rather than mailhog
 * Use your own reverse proxy rather than the provided nginx
 * Use your own database cluster

Container data gets stored in `./data`, and secrets in `./secrets`.
N.B. that config files in `./data` will get overwritten by the templates from `./data-template` every time the cluster
is launched.

## To admin

```bash
# To upgrade
docker compose pull
```

```bash
# To register a user
docker compose exec mas mas-cli -c /data/config.yaml manage register-user

# To register an admin unattended
docker compose exec mas mas-cli manage register-user -c /data/config.yaml -y -p <Passw0rd> -a <admin-name>
```

## Diagnostics

```bash
# check that OIDC is working - useful for debugging TLS problems
docker compose exec mas mas-cli -c /data/config.yaml doctor
````

## Other resources

 * This is based on https://github.com/element-hq/element-docker-demo
