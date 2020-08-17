#!/bin/sh

# create directory to persist ssh & sshd config
mkdir -vm 700 /config/.ssh 2>/dev/null || true

# replace /etc/ssh with a symlink
if [ "$(readlink -f /etc/ssh)" != "/config/.ssh" ]
then
    rsync -av --ignore-existing /etc/ssh/ /config/.ssh/ 2>/dev/null || true
    rm -rvf /etc/ssh 2>/dev/null || true
    ln -sv /config/.ssh /etc/ssh
fi

# replace /root/.ssh with a symlink
if [ "$(readlink -f /root/.ssh)" != "/config/.ssh" ]
then
    rsync -av --ignore-existing /root/.ssh/ /config/.ssh/ 2>/dev/null || true
    rm -rvf /root/.ssh 2>/dev/null || true
    ln -sv /config/.ssh /root/.ssh
fi

# generate new host keys if required
/usr/bin/ssh-keygen -A

# replace authorized keys if a url was provided
if curl -fsSL "${AUTHORIZED_KEYS_URL}" 1>/dev/null 2>&1
then
    curl -fsSL "${AUTHORIZED_KEYS_URL}" > /config/.ssh/authorized_keys
fi

# set ownership and permissions of ssh config
chown -vR root:root /config/.ssh
chmod -vR 700 /config/.ssh

# remove existing profile customizations
sed '/HASS_SERVER/d' -i /etc/profile
sed '/HASS_TOKEN/d' -i /etc/profile
sed '/cd \/config/d' -i /etc/profile

# set new profile customizations
cat >> /etc/profile << EOF
export HASS_SERVER=${HASS_SERVER}
export HASS_TOKEN=${HASS_TOKEN}
cd /config
EOF

# execute the passed in program
exec "$@"
