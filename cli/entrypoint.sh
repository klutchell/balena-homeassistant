#!/bin/sh

if [ ! -f /keys/ssh_host_rsa_key ] \
|| [ ! -f /keys/ssh_host_dsa_key ] \
|| [ ! -f /keys/ssh_host_ecdsa_key ] \
|| [ ! -f /keys/ssh_host_ed25519_key ]
then
    /usr/bin/ssh-keygen -A
    mv /etc/ssh/ssh_host_* /keys/
fi

if curl -fsSL "${AUTHORIZED_KEYS_URL}" 1>/dev/null 2>&1
then
    curl -fsSL "${AUTHORIZED_KEYS_URL}" | tee /keys/authorized_keys
fi

chown -R root:root /keys
chmod -R 700 /keys

echo "export HASS_SERVER=${HASS_SERVER}" | tee -a /etc/profile
echo "export HASS_TOKEN=${HASS_TOKEN}" | tee -a /etc/profile
echo "cd /config" | tee -a /etc/profile

exec "$@"