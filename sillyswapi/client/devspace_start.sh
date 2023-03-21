#!/bin/bash

echo "api swapi.${NAMESPACE}.svc.cluster.local" > /etc/host.aliases
echo "export HOSTALIASES=/etc/host.aliases" >> /etc/profile
. /etc/profile

pip install -qq --no-cache-dir --upgrade -e . 2>&1 > /dev/null

bash