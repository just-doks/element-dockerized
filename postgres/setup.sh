#!/usr/bin/env bash

mkdir data
mkdir -p /opt/secrets/postgresql

# create blank secrets to avoid docker creating empty directories in the host
touch /opt/secrets/postgresql/postgres \
    /opt/secrets/postgresql/synapse_user \
    /opt/secrets/postgresql/mas_user

if [[ ! -s /opt/secrets/postgresql/postgres ]]; then
	head -c16 /dev/urandom | base64 | tr -d '=' > /opt/secrets/postgresql/postgres
fi

if [[ ! -s /opt/secrets/postgresql/synapse_user ]]; then
	head -c16 /dev/urandom | base64 | tr -d '=' > /opt/secrets/postgresql/synapse_user
fi

if [[ ! -s /opt/secrets/postgresql/mas_user ]]; then
	head -c16 /dev/urandom | base64 | tr -d '=' > /opt/secrets/postgresql/mas_user
fi

docker network create --driver bridge --internal pg-net