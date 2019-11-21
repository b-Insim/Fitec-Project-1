#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"

export DEBIAN_FRONTEND=noninteractive

if [ "$HOSTNAME" = "control" ]; then

	ansible-playbook  -i inventory DNSmasq.yml
	ansible-playbook  -i inventory maria.yml


if
