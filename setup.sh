#!/bin/bash

set -e
#set -x

# set up data & secrets dir with the right ownerships in the default location
# to stop docker autocreating them with random owners.
# originally these were checked into the git repo, but that's pretty ugly, so doing it here instead.
mkdir -p data/{element-web,mas,nginx/{www,conf.d},synapse}
mkdir -p /opt/secrets/{synapse,mas}

# create blank secrets to avoid docker creating empty directories in the host
touch /opt/secrets/synapse/signing.key

# grab an env if we don't have one already
if [[ ! -e .env  ]]; then
    cp .env-sample .env

    sed -ri.orig "s/^USER_ID=/USER_ID=$(id -u)/" .env
    sed -ri.orig "s/^GROUP_ID=/GROUP_ID=$(id -g)/" .env
else
    echo ".env already exists; move it out of the way first to re-setup"
fi

if ! [ -z "$success" ]; then
    echo "Configure '.env' file. Then, run: docker compose up"
fi
