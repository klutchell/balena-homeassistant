#!/bin/sh

/usr/bin/ssh-keygen -A

if curl -fsSL "${AUTHORIZED_KEYS_URL}" 1>/dev/null 2>&1
then
    curl -fsSL "${AUTHORIZED_KEYS_URL}" | tee /root/.ssh/authorized_keys
fi

chown -R root:root "/root/.ssh"
chmod -R 700 "/root/.ssh"

sed '/cd \/config/d' -i /root/.bashrc
echo 'cd /config' >> /root/.bashrc

mkdir /run/sshd 2>/dev/null || true

/usr/sbin/sshd -p 22 -D