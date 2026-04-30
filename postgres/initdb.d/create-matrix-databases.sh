#!/usr/bin/env bash
set -euo pipefail

# Read passwords from environment variables or files
SYNAPSE_PASSWORD="$(cat /run/secrets/synapse_password)"
MAS_PASSWORD="$(cat /run/secrets/mas_password)"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  -- Synapse
  CREATE USER synapse_user WITH PASSWORD '${SYNAPSE_PASSWORD}';
  CREATE DATABASE synapse
    WITH OWNER synapse_user
    ENCODING 'UTF8'
    LC_COLLATE 'C'
    LC_CTYPE 'C'
    TEMPLATE template0;

  -- MAS
  CREATE USER mas_user WITH PASSWORD '${MAS_PASSWORD}';
  CREATE DATABASE mas
    WITH OWNER mas_user;
EOSQL