#!/usr/bin/env bash
# shellcheck disable=2034,2209,2135,2155

COMPOSE_PROJECT_NAME=my-site
DOCKER_IMAGE_NAME="samba6/kanmii:${COMPOSE_PROJECT_NAME}-app__0.0.0"
CONTAINER_NAME=my-site-app

IP=127.0.0.1
APP_NAME=my-site
SERVER_TLD=local
DOMAIN="${APP_NAME}.${SERVER_TLD}"
DB_HOST=mysql
DB_NAME=my-site
DB_ROOT_PASSWORD=password
DB_TABLE_PREFIX=my_site_wp_

DOCKER_HOST_NGINX_HTTP_PORT=80
# DOCKER_HOST_NGINX_HTTP_PORT=63980
DOCKER_HOST_NGINX_TLS_PORT=443
# DOCKER_HOST_NGINX_TLS_PORT=63981
DOCKER_HOST_DB_PORT=63982
DOCKER_HOST_PHP_ADMIN_PORT=63983
DOCKER_HOST_MAIL_PORT=63984
DOCKER_HOST_APP_PORT=63985
DOCKER_ENV_FILE=.env.d

# -----------------------------------------------------------------------------
# START TLS CERTIFICATES
# -----------------------------------------------------------------------------
# CA_ROOT=./_certs/mkcert-ca-root.pem
# CA_ROOT=/c/Users/kanmii/AppData/Local/mkcert

# SITE_CERT_FOLDER=./certs
# SITE_CERT_FOLDER=/c/Users/kanmii/certificates
# -----------------------------------------------------------------------------
# END TLS CERTIFICATES
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# SETTINGS FROM src/.env.example - FOR WORDPRESS
# -----------------------------------------------------------------------------
DB_NAME='my-site'
DB_USER='root'
DB_PASSWORD='password'

# Optionally, you can use a data source name (DSN) When using a DSN, you can
# remove the DB_NAME, DB_USER, DB_PASSWORD, and DB_HOST variables
# DATABASE_URL='mysql://database_user:database_password@database_host:database_port/database_name'

# Optional variables
DB_HOST='mysql'
# DB_PREFIX="${DB_TABLE_PREFIX}"

WP_ENV='development'
WP_HOME="https://${DOMAIN}"

WP_SITEURL="${WP_HOME}/wp"
WP_DEBUG_LOG=./__debug/debug.log

# Generate your keys here: https://roots.io/salts.html
AUTH_KEY='generateme'
SECURE_AUTH_KEY='generateme'
LOGGED_IN_KEY='generateme'
NONCE_KEY='generateme'
AUTH_SALT='generateme'
SECURE_AUTH_SALT='generateme'
LOGGED_IN_SALT='generateme'
NONCE_SALT='generateme'

# -----------------------------------------------------------------------------
# CLOUDFLARE
# -----------------------------------------------------------------------------
CLOUDFLARE_TUNNEL_NAME=wp-use
CLOUDFLARE_TUNNEL_DOMAIN=callmiy.com
CLOUDFLARE_TUNNEL_CONFIG_FILE=.cloudflare-tunnel-config-wp-use.yml
