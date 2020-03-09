FROM balenalib/raspberrypi4-64-alpine-python:3-run

RUN apk add --no-cache \
    augeas \
    build-base \
    ca-certificates \
    curl \
    gcc \
    git \
    musl-dev \
    openssh-server \
    rsync \
    shadow \
    sqlite \
    tar \
    tzdata \
    && rm -rf /var/cache/apk/* \
    && pip3 install homeassistant-cli \
    && augtool set /files/etc/ssh/sshd_config/HostKey[1] /keys/ssh_host_rsa_key \
    && augtool set /files/etc/ssh/sshd_config/HostKey[2] /keys/ssh_host_dsa_key \
    && augtool set /files/etc/ssh/sshd_config/HostKey[3] /keys/ssh_host_ecdsa_key \
    && augtool set /files/etc/ssh/sshd_config/HostKey[4] /keys/ssh_host_ed25519_key \
    && augtool set /files/etc/ssh/sshd_config/AuthorizedKeysFile /keys/authorized_keys \
    && augtool set /files/etc/ssh/sshd_config/PubkeyAuthentication yes \
    && augtool set /files/etc/ssh/sshd_config/PasswordAuthentication no \
    && usermod -p '' root

VOLUME /keys

WORKDIR /config

COPY entrypoint.sh /

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
