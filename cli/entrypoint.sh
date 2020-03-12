#!/bin/sh

/usr/bin/ssh-keygen -A
mkdir -m 700 /config/.ssh 2>/dev/null || true
rsync -av --ignore-existing /etc/ssh/ /config/.ssh/

if curl -fsSL "${AUTHORIZED_KEYS_URL}" 1>/dev/null 2>&1
then
    curl -fsSL "${AUTHORIZED_KEYS_URL}" > /config/.ssh/authorized_keys
fi

chown -R root:root /config/.ssh
chmod -R 700 /config/.ssh

echo "export HASS_SERVER=${HASS_SERVER}" >> /etc/profile
echo "export HASS_TOKEN=${HASS_TOKEN}" >> /etc/profile
echo "cd /config" >> /etc/profile

exec "$@"