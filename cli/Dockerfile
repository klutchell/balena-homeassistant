FROM balenalib/raspberrypi4-64-python:3-run

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    augeas-tools \
    build-essential \
    ca-certificates \
    curl \
    git \
    openssh-server \
    sqlite3 \
    tar \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -v /etc/ssh/ssh_host_* \
    && augtool set /files/etc/ssh/sshd_config/HostKey[1] /keys/ssh_host_rsa_key \
    && augtool set /files/etc/ssh/sshd_config/HostKey[2] /keys/ssh_host_dsa_key \
    && augtool set /files/etc/ssh/sshd_config/HostKey[3] /keys/ssh_host_ecdsa_key \
    && augtool set /files/etc/ssh/sshd_config/HostKey[4] /keys/ssh_host_ed25519_key \
    && augtool set /files/etc/ssh/sshd_config/AuthorizedKeysFile /keys/authorized_keys \
    && augtool set /files/etc/ssh/sshd_config/PubkeyAuthentication yes \
    && augtool set /files/etc/ssh/sshd_config/PasswordAuthentication no \
    && pip3 install homeassistant-cli

VOLUME /keys
VOLUME /run/sshd

WORKDIR /config

COPY entrypoint.sh /

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
