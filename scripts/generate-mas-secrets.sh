#!/usr/bin/bash

# a replacement entrypoint script for the MAS docker image which generates default config & secrets if needed.

if [[ -f /data/config.yaml ]]
then
	echo "MAS config found - not generating default"
	exit 0
fi

ls /usr/local/bin

echo "MAS config not found - generating default for secrets"
exec mas-cli config generate -o /data/config.yaml.default